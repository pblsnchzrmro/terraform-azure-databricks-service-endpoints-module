# ========================================
# Local Values
# ========================================

locals {
  # Storage subnet configuration from NCC
  all_storage_subnets = [for conf in databricks_mws_network_connectivity_config.ncc.egress_config :
    [for rule in conf.default_rules :
      [for se_rule in rule.azure_service_endpoint_rule :
        se_rule.subnets if contains(se_rule.target_services, "AZURE_BLOB_STORAGE")
      ]
    ]
  ]
  uniq_storage_subnets = distinct(flatten(local.all_storage_subnets))

  # Resource naming conventions
  resource_group_name             = "rg-${var.project_name}"
  vnet_name                       = "vnet-${var.project_name}"
  nsg_name                        = "nsg-${var.project_name}"
  public_subnet_name              = "snet-${var.project_name}-public"
  private_subnet_name             = "snet-${var.project_name}-private"
  storage_account_name            = "st${replace(var.project_name, "-", "")}"
  workspace_access_connector_name = "dac-${var.project_name}-workspace"
  storage_access_connector_name   = "dac-${var.project_name}-storage"
  user_assigned_identity_name     = "id-${var.project_name}-storage"
  databricks_workspace_name       = "dbw-${var.project_name}"
  managed_resource_group_name     = "rg-${var.project_name}-databricks-managed"
  storage_credential_name         = "sc-${var.project_name}-external"
  external_location_name          = "el-${var.project_name}-external"
}
