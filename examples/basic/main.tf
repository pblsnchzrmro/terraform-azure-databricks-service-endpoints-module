# ========================================
# Basic Example - Databricks with Service Endpoints
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

  # Network Configuration (using defaults)
  cidr_block           = "10.0.0.0/24"
  private_subnets_cidr = "10.0.0.0/25"
  public_subnets_cidr  = "10.0.0.128/25"

  # Security Configuration
  public_network_access_enabled    = true
  default_storage_firewall_enabled = true

  # Tags
  tags = {
    Environment = "Development"
    ManagedBy   = "Terraform"
    Example     = "Basic"
  }
}
