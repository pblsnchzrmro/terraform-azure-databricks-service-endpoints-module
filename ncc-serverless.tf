# ========================================
# Network Connectivity Configuration
# ========================================

resource "databricks_mws_network_connectivity_config" "ncc" {
  provider = databricks.accounts
  name     = "ncc-${azurerm_databricks_workspace.workspace.name}"
  region   = var.azure_region
}

# ========================================
# NCC Workspace Binding
# ========================================

resource "databricks_mws_ncc_binding" "ncc_binding" {
  provider                       = databricks.accounts
  network_connectivity_config_id = databricks_mws_network_connectivity_config.ncc.network_connectivity_config_id
  workspace_id                   = azurerm_databricks_workspace.workspace.workspace_id
}
