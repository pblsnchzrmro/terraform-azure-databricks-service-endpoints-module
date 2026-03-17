# ========================================
# Azure Configuration
# ========================================

variable "azure_region" {
  type        = string
  description = "The Azure location for deploying infrastructure resources"
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
# Network Configuration
# ========================================

variable "cidr_block" {
  type        = string
  description = "IP address range for the virtual network"
}

variable "private_subnets_cidr" {
  type        = string
  description = "IP address space allocated to the private subnet"
}

variable "public_subnets_cidr" {
  type        = string
  description = "IP address space allocated to the public subnet"
}

variable "allowed_ips" {
  type        = list(string)
  description = "IP addresses permitted to access storage through firewall exceptions"
  default     = []
}

variable "network_security_group_rules_required" {
  type        = string
  description = "Defines the scope of network security group rules to apply"
  default     = "AllRules"
}

# ========================================
# Project Configuration
# ========================================

variable "project_name" {
  type        = string
  description = "Identifier prefix applied to resource names"
}

variable "tags" {
  type        = map(string)
  description = "Key-value pairs for labeling deployed resources"
  default     = {}
}

# ========================================
# Security Configuration
# ========================================

variable "default_storage_firewall_enabled" {
  type        = bool
  description = "Enable firewall restrictions on the primary storage account"
  default     = true
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Controls whether the workspace UI is accessible from the internet"
  default     = false
}
