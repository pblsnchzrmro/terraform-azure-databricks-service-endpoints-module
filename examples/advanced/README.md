# Advanced Example

This example demonstrates an advanced, production-ready deployment of Azure Databricks with custom network configuration, enhanced security, and IP whitelisting.

## Features

- **Custom Network Configuration**: Larger VNet with custom CIDR blocks
- **Enhanced Security**: Private network access with storage firewall
- **IP Whitelisting**: Restricted storage access to specific IP addresses
- **Unity Catalog**: Full integration with external storage credentials
- **Service Endpoints**: Azure Storage service endpoints for secure connectivity
- **NCC for Serverless**: Network Connectivity Configuration for serverless compute

## Prerequisites

- Azure subscription
- Databricks account with Unity Catalog enabled
- Terraform >= 1.0
- Azure CLI authenticated or service principal credentials
- List of allowed IP addresses for storage access

## Usage

1. Copy the example tfvars file:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```

2. Edit `terraform.tfvars` with your production values:
   - Azure subscription ID
   - Databricks account ID and host
   - Unity Catalog metastore name
   - DBFS storage account name
   - Project name prefix
   - Custom network CIDR blocks
   - Allowed IP addresses for storage access
   - Security settings
   - Resource tags

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

This example uses a larger network range suitable for production:
- VNet CIDR: `10.100.0.0/23` (512 IPs)
- Private subnet: `10.100.0.0/24` (256 IPs)
- Public subnet: `10.100.1.0/24` (256 IPs)

You can customize these values in `terraform.tfvars`.

## Security Features

### Private Network Access
- `public_network_access_enabled = false`: Workspace is only accessible via private endpoints
- `default_storage_firewall_enabled = true`: Storage account has firewall enabled

### IP Whitelisting
The `allowed_ips` variable restricts storage access to specific IP addresses:
- Jump hosts or bastion servers
- CI/CD pipeline agents
- Corporate network egress IPs

### Network Security Groups
- All security group rules are applied (`network_security_group_rules_required = "AllRules"`)
- Databricks-managed security rules for workspace communication

## Outputs

The example provides comprehensive outputs including:
- Databricks workspace details (URL, ID)
- Unity Catalog resources (metastore, credentials, external location)
- Network resources (VNet, subnets, NCC)
- Storage resources (account, container)
- Resource group details

## Production Considerations

### Tagging Strategy
This example includes comprehensive tags:
- `Environment`: Deployment environment
- `ManagedBy`: Infrastructure management tool
- `CostCenter`: Cost allocation
- `Compliance`: Regulatory requirements

### Monitoring and Logging
Consider adding:
- Azure Monitor diagnostic settings
- Log Analytics workspace integration
- Databricks audit logs

### Backup and DR
- Configure storage account replication (default: ZRS)
- Document workspace recovery procedures
- Maintain Terraform state in remote backend

## Clean Up

To destroy all created resources:
```bash
terraform destroy
```

⚠️ **Warning**: This will delete all resources including the workspace and data. Ensure you have backups before destroying.

## See Also

- [Basic Example](../basic/) - Simple deployment with defaults
- [Module Documentation](../../README.md) - Full module reference
