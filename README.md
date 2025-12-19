## Todo UI Application Monolithic Deployment Infrastructure

A comprehensive Infrastructure as Code (IaC) solution using Terraform to provision and manage Azure cloud resources. This project provides modular, reusable components for deploying secure, scalable infrastructure including virtual machines, databases, networking, and secrets management.

## 📋 Table of Contents

- [Features](#features)
- [Architecture](#architecture)
- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Modules](#modules)
- [Environments](#environments)
- [CI/CD Pipelines](#cicd-pipelines)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)

## ✨ Features

- **Modular Design**: Reusable Terraform modules for Azure resources
- **Multi-Environment Support**: Separate configurations for development and production
- **Secure Secrets Management**: Integration with Azure Key Vault
- **Automated CI/CD**: Azure DevOps pipelines for infrastructure deployment
- **Infrastructure as Code**: Version-controlled, repeatable deployments
- **Azure Best Practices**: Following Microsoft Azure architecture guidelines

## 🏗️ Architecture

```
Terra-Pipe/
├── Environment/          # Environment-specific configurations
│   ├── dev/             # Development environment
│   └── Prod/            # Production environment
├── module/              # Reusable Terraform modules
│   ├── azurerm_database/
│   ├── azurerm_key_secret/
│   ├── azurerm_kv/
│   ├── azurerm_pip/
│   ├── azurerm_rg/
│   ├── azurerm_sql_server/
│   ├── azurerm_vm/
│   └── azurerm_vnet/
├── pipelines/           # CI/CD pipeline definitions
└── README.md
```

## 📋 Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0.0
- [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli)
- Azure subscription with appropriate permissions
- Azure DevOps organization (for CI/CD)

## 🚀 Quick Start

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/terra-pipe.git
   cd terra-pipe
   ```

2. **Authenticate with Azure**
   ```bash
   az login
   ```

3. **Navigate to environment directory**
   ```bash
   cd Environment/dev
   ```

4. **Initialize Terraform**
   ```bash
   terraform init
   ```

5. **Plan the deployment**
   ```bash
   terraform plan -var-file="terraform.tfvars"
   ```

6. **Apply the configuration**
   ```bash
   terraform apply -var-file="terraform.tfvars"
   ```

## 📦 Modules

### Core Infrastructure Modules

| Module | Description | Resources |
|--------|-------------|-----------|
| `azurerm_rg` | Resource Group management | Azure Resource Groups |
| `azurerm_vnet` | Virtual Network configuration | VNets, Subnets |
| `azurerm_pip` | Public IP addresses | Public IPs |
| `azurerm_vm` | Virtual Machines | VMs, NICs, Disks |
| `azurerm_kv` | Key Vault | Azure Key Vault |
| `azurerm_key_secret` | Key Vault Secrets | Secrets, Access Policies |
| `azurerm_sql_server` | SQL Server | Azure SQL Servers |
| `azurerm_database` | SQL Databases | Azure SQL Databases |

### Module Usage Example

```hcl
module "rg" {
  source = "../../module/azurerm_rg"
  rgs    = var.rgs
}

module "vm" {
  depends_on = [module.vnet, module.pip, module.kv]
  source     = "../../module/azurerm_vm"
  vms        = var.vms
}
```

## 🌍 Environments

### Development Environment (`Environment/dev/`)
- Sandbox for testing and development
- Minimal resource allocation
- Cost-optimized configurations

### Production Environment (`Environment/Prod/`)
- Production-ready configurations
- High availability and scalability
- Security-hardened settings

## 🔄 CI/CD Pipelines

The project includes Azure DevOps pipeline configurations for automated infrastructure deployment:

### Pipeline Stages

1. **Terraform Init**: Initialize Terraform backend and providers
2. **Validate**: Syntax and configuration validation
3. **Plan**: Generate execution plan
4. **Apply**: Deploy infrastructure changes
5. **Destroy** (optional): Clean up resources

### Pipeline Features

- **Branch-based Triggers**: Automatic runs on main and feature branches
- **Environment Parameters**: Configurable deployment targets
- **Approval Gates**: Manual approval for production deployments
- **Remote State**: Azure Storage backend for state management

## 📖 Usage

### Customizing Variables

Edit the `terraform.tfvars` file in your environment directory to customize:

```hcl
# Resource Group Configuration
rgs = {
  rg1 = {
    name     = "my-resource-group"
    location = "East US"
  }
}

# Virtual Machine Configuration
vms = {
  vm1 = {
    name           = "my-vm"
    size           = "Standard_DS1_v2"
    admin_username = "adminuser"
  }
}
```

### Managing State

The project uses Azure Storage for remote Terraform state:

```bash
# Initialize with backend
terraform init -backend-config="resource_group_name=NetworkWatcherRG" \
               -backend-config="storage_account_name=remotebackendstgm"
```

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

### Development Guidelines

- Follow Terraform best practices
- Use consistent naming conventions
- Add documentation for new modules
- Test changes in development environment first

## 📄 License



**Built with ❤️ using Terraform and Azure**

