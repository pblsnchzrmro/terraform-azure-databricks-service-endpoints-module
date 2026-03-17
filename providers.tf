# ========================================
# Azure Provider
# ========================================

provider "azurerm" {
  subscription_id = var.azure_subscription_id
  features {}
}

# ========================================
# Databricks Providers
# ========================================

provider "databricks" {
  alias      = "accounts"
  host       = var.databricks_account_host
  account_id = var.databricks_account_id
}

provider "databricks" {
  alias = "workspace"
  host  = azurerm_databricks_workspace.workspace.workspace_url
}
