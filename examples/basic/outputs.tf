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

output "external_location_url" {
  description = "URL of the external location"
  value       = module.databricks_workspace.external_location_url
}

# ========================================
# Network Outputs
# ========================================

output "vnet_id" {
  description = "ID of the virtual network"
  value       = module.databricks_workspace.vnet_id
}

# ========================================
# Storage Outputs
# ========================================

output "storage_account_name" {
  description = "Name of the ADLS storage account"
  value       = module.databricks_workspace.storage_account_name
}
