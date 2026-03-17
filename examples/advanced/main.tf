# ========================================
# Advanced Example - Databricks with Custom Network and Security
# ========================================

module "databricks_workspace" {
  source = "../.."

  # Azure Configuration
  azure_region          = var.azure_region
  azure_subscription_id = var.azure_subscription_id

  # Databricks Configuration
  databricks_account_host = var.databricks_account_host
  databricks_account_id   = var.databricks_account_id
  databricks_metastore    = var.databricks_metastore
  dbfs_storage_account    = var.dbfs_storage_account

  # Project Configuration
  project_name = var.project_name

  # Custom Network Configuration
  cidr_block           = var.cidr_block
  private_subnets_cidr = var.private_subnets_cidr
  public_subnets_cidr  = var.public_subnets_cidr

  # Security Configuration
  public_network_access_enabled         = var.public_network_access_enabled
  default_storage_firewall_enabled      = var.default_storage_firewall_enabled
  network_security_group_rules_required = var.network_security_group_rules_required
  allowed_ips                           = var.allowed_ips

  # Tags
  tags = var.tags
}
