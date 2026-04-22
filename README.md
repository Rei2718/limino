# limino-backend

Backend API built with Go and Azure.

## Prerequisites

Ensure you have the following CLI tools installed:
- Azure CLI
- Terraform
- Docker
- Make

## Structure

```text
limino/
├── api/            # Go API server and Docker
├── azure/          # Terraform infrastructure
├── .gitignore
└── README.md
```

## Setup

### 1. Login to Azure

```bash
$ az login
```

### 2. Initialize Terraform

```bash
$ cd azure && terraform init
```

### 3. Login to ACR

```bash
$ az acr login --name {registryName}
```

## Commands

### Infrastructure

#### Preview changes

```bash
$ terraform plan
```

#### Apply changes

```bash
$ terraform apply
```

#### Destroy all resources

```bash
$ terraform destroy
```

### Application

#### Build and push Docker image to ACR

```bash
$ make build
```

#### Build and apply infrastructure

```bash
$ make deploy
```

## Environments

| Environment | Location | Target Branch | Purpose |
| :--- | :--- | :--- | :--- |
| `dev` | Local / Azure Dev | `develop` | Local development and feature validation |
| `staging` | Azure Staging | `main` | Pre-production testing and QA validation |
| `prod` | Azure Production | `release/*` | Live application for end-users |

## Notes

1. Never commit `terraform.tfstate` or `.env` to Git.
2. All secrets must be managed via Azure Key Vault.