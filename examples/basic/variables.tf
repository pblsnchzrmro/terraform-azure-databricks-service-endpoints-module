# ========================================
# Azure Configuration
# ========================================

variable "azure_region" {
  type        = string
  description = "The Azure location for deploying infrastructure resources"
  default     = "eastus"
}

variable "azure_subscription_id" {
  type        = string
  description = "Target Azure subscription identifier"
}

# ========================================
# Databricks Configuration
# ========================================

variable "databricks_account_host" {
  type        = string
  description = "The account console endpoint for Databricks"
  default     = "https://accounts.azuredatabricks.net"
}

variable "databricks_account_id" {
  type        = string
  description = "Unique identifier for the Databricks account"
}

variable "databricks_metastore" {
  type        = string
  description = "Unity Catalog metastore identifier for Databricks"
}

variable "dbfs_storage_account" {
  type        = string
  description = "Storage account identifier for Databricks File System"
}

# ========================================
# Project Configuration
# ========================================

variable "project_name" {
  type        = string
  description = "Identifier prefix applied to resource names"
  default     = "dbx-example"
}
