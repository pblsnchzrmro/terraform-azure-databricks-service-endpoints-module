# Basic Example

This example demonstrates a basic deployment of Azure Databricks with service endpoints using default network configuration.

## Features

- Single Databricks workspace with Premium SKU
- VNet injection with service endpoints for Azure Storage
- Unity Catalog integration with external location
- Network Connectivity Configuration (NCC) for serverless compute
- ADLS Gen2 storage with managed identity authentication

## Prerequisites

- Azure subscription
- Databricks account with Unity Catalog enabled
- Terraform >= 1.0
- Azure CLI authenticated or service principal credentials

## Usage

1. Copy the example tfvars file:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

2. Edit `terraform.tfvars` with your values:
   - Azure subscription ID
   - Databricks account ID and host
   - Unity Catalog metastore name
   - DBFS storage account name
   - Project name prefix

3. Initialize Terraform:
   ```bash
   terraform init
   ```

4. Review the plan:
   ```bash
   terraform plan
   ```

5. Apply the configuration:
   ```bash
   terraform apply
   ```

## Network Configuration

This example uses the default network configuration:
- VNet CIDR: `10.0.0.0/24`
- Private subnet: `10.0.0.0/25`
- Public subnet: `10.0.0.128/25`

## Outputs

The example provides the following outputs:
- `databricks_workspace_url` - URL to access the Databricks workspace
- `databricks_workspace_id` - Workspace ID for API operations
- `external_location_url` - Unity Catalog external location URL
- `vnet_id` - Virtual network resource ID
- `storage_account_name` - ADLS Gen2 storage account name

## Clean Up

To destroy all created resources:
```bash
terraform destroy
```

## Next Steps

For more advanced configurations, see the `examples/advanced` directory.
