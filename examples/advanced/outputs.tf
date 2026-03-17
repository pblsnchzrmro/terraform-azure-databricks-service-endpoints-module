# ========================================
# Databricks Outputs
# ========================================

output "databricks_workspace_id" {
  description = "ID of the Databricks workspace"
  value       = module.databricks_workspace.databricks_workspace_id
}

output "databricks_workspace_url" {
  description = "URL of the Databricks workspace"
  value       = module.databricks_workspace.databricks_workspace_url
}

output "external_location_name" {
  description = "Name of the external location"
  value       = module.databricks_workspace.external_location_name
}

output "external_location_url" {
  description = "URL of the external location"
  value       = module.databricks_workspace.external_location_url
}

output "metastore_id" {
  description = "ID of the metastore"
  value       = module.databricks_workspace.metastore_id
}

output "storage_credential_name" {
  description = "Name of the storage credential"
  value       = module.databricks_workspace.storage_credential_name
}

# ========================================
# Network Outputs
# ========================================

output "ncc_id" {
  description = "ID of the Network Connectivity Configuration"
  value       = module.databricks_workspace.ncc_id
}

output "private_subnet_id" {
  description = "ID of the private subnet"
  value       = module.databricks_workspace.private_subnet_id
}

output "public_subnet_id" {
  description = "ID of the public subnet"
  value       = module.databricks_workspace.public_subnet_id
}

output "vnet_id" {
  description = "ID of the virtual network"
  value       = module.databricks_workspace.vnet_id
}

# ========================================
# Resource Group Outputs
# ========================================

output "resource_group_id" {
  description = "ID of the resource group"
  value       = module.databricks_workspace.resource_group_id
}

output "resource_group_name" {
  description = "Name of the resource group"
  value       = module.databricks_workspace.resource_group_name
}

# ========================================
# Storage Outputs
# ========================================

output "storage_account_id" {
  description = "ID of the ADLS storage account"
  value       = module.databricks_workspace.storage_account_id
}

output "storage_account_name" {
  description = "Name of the ADLS storage account"
  value       = module.databricks_workspace.storage_account_name
}

output "storage_container_name" {
  description = "Name of the storage container"
  value       = module.databricks_workspace.storage_container_name
}
