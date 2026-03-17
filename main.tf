# ========================================
# Data Sources
# ========================================

data "databricks_metastore" "metastore" {
  provider = databricks.accounts
  name     = var.databricks_metastore
}
