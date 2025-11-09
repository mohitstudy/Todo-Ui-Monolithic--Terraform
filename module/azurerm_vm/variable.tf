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
    vm_size     = string
    kv_name    = string
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


