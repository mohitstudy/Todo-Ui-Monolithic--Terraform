variable "rgs" {
    type = map(object({
        name     = string
        location = string
    }))
}

variable "vnets" {
    type = map(object({
        name          = string
        location      = string
        rg_name       = string
        address_space = list(string)
        subnets = map(object({
            name             = string
            address_prefixes = list(string)
        }))
    }))
}

variable "pips" {
    type = map(object({
        name              = string
        rg_name          = string
        location         = string
        allocation_method = string
    }))
}

variable "vms" {
  description = "Map of VM configurations"
  type = map(object({
    vm_name     = string
    location    = string
    rg_name     = string
    nic_name    = string
    vnet_name   = string
    subnet_name = string
    pip_name    = string
    kv_name    = string
    vm_size     = string
    nsg_name   = string
    user_secret_name   = string
    pwd_secret_name   = string
    ip_configurations = map(object({
      name                          = string
      private_ip_address_allocation = string
    }))

    storage_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
  }))
}

variable "kv" {
  description = "Map of Key Vaults to create"
  type = map(object({
    kv_name                      = string
    location                     = string
    rg_name                      = string
    enabled_for_disk_encryption  = bool
    soft_delete_retention_days   = number
    purge_protection_enabled     = bool
  }))
}


variable "sql_servers" {
  description = "A map of SQL Servers to create"
  type = map(object({
    server_name                 = string
    rg_name                     = string
    location                    = string
    version                     = string
    kv_name                     = string
    user_secret_name            = string
    pwd_secret_name             = string
  }))
}



variable "sqldb" {
  description = "A map of SQL databases to create"
  type = map(object({
    db_name       = string
    collation     = string
    license_type  = string
    max_size_gb   = number
    server_name  = string
    rg_name     = string
  }))
}

variable "secrets" {
  description = "Map of password secrets configuration"
  type = map(object({
    length  = number
    special = bool
  }))
}

variable "usernames" {
  description = "Map of usernames to store as secrets in Key Vault"
  type        = map(string)
}



