# ========================================
# Storage Account
# ========================================

resource "azurerm_storage_account" "adls" {
  name                     = local.storage_account_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.azure_region
  account_tier             = "Standard"
  account_replication_type = "ZRS"
  is_hns_enabled           = true
  tags                     = var.tags

  depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_storage_account_network_rules" "adls" {
  storage_account_id         = azurerm_storage_account.adls.id
  default_action             = "Deny"
  virtual_network_subnet_ids = concat([azurerm_subnet.public.id], local.uniq_storage_subnets)
  ip_rules                   = var.allowed_ips

  depends_on = [
    azurerm_storage_account.adls,
    azurerm_subnet.public,
    azurerm_subnet.private,
    databricks_mws_network_connectivity_config.ncc
  ]
}

# ========================================
# Storage Container
# ========================================

resource "azurerm_storage_container" "data" {
  name                  = "data"
  storage_account_id    = azurerm_storage_account.adls.id
  container_access_type = "private"

  depends_on = [azurerm_storage_account.adls]
}

# ========================================
# Managed Identity for Storage Access
# ========================================

resource "azurerm_user_assigned_identity" "storage" {
  name                = local.user_assigned_identity_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.azure_region
  tags                = var.tags

  depends_on = [azurerm_resource_group.rg]
}

resource "azurerm_role_assignment" "storage_blob_contributor" {
  scope                = azurerm_storage_account.adls.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_user_assigned_identity.storage.principal_id

  depends_on = [
    azurerm_storage_account.adls,
    azurerm_user_assigned_identity.storage
  ]
}

# ========================================
# Databricks Access Connector for Storage
# ========================================

resource "azurerm_databricks_access_connector" "storage" {
  name                = local.storage_access_connector_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = var.azure_region
  tags                = var.tags

  identity {
    type         = "UserAssigned"
    identity_ids = [azurerm_user_assigned_identity.storage.id]
  }

  depends_on = [azurerm_user_assigned_identity.storage]
}

