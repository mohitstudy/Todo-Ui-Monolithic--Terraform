rgs = {
  rg1 = {
    name     = "rg-mk"
    location = "central india"
  }
}


vnets = {
  vnet1 = {
    name          = "vnet-mk"
    location      = "central india"
    rg_name       = "rg-mk"
    address_space = ["10.0.0.0/16"]
    subnets = {
      subnet1 = {
        name             = "frontend-subnet"
        address_prefixes = ["10.0.1.0/24"]
      }
      subnet2 = {
        name             = "backend-subnet"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
  }
}

pips = {
  pip1 = {
    name              = "frontend-pip-mk"
    rg_name          = "rg-mk"
    location         = "central india"
    allocation_method = "Static"
  }
    pip2 = {
    name              = "backend-pip-mk"
    rg_name          = "rg-mk"
    location         = "central india"
    allocation_method = "Static"
  }
}


vms = {
  vm1 = {
    nic_name   = "frontend-nic-mk"
    location   = "central india"
    rg_name    = "rg-mk"
    vnet_name  = "vnet-mk"
    subnet_name = "frontend-subnet"
    vm_size    = "Standard_B1s"
    vm_name    = "frontend-vm-mk"
    pip_name   = "frontend-pip-mk"
    kv_name   = "kv-mk"
    nsg_name   = "frontend-nsg-mk"
    user_secret_name   = "vmadminusername"
    pwd_secret_name   = "vmadminpassword"
    ip_configurations = {
      ipconfig1 = {
        name                          = "ipconfig1"
        private_ip_address_allocation = "Dynamic"
      }
    }

    storage_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }

  }
  vm2 = {
    nic_name   = "backend-nic-mk"
    location   = "central india"
    rg_name    = "rg-mk"
    vnet_name  = "vnet-mk"
    subnet_name = "backend-subnet"
    vm_size    = "Standard_B1s"
    vm_name    = "backend-vm-mk"
    pip_name   = "backend-pip-mk"
    kv_name   = "kv-mk"
    nsg_name   = "backend-nsg-mk"
    user_secret_name   = "vmadminusername"
    pwd_secret_name   = "vmadminpassword"
    ip_configurations = {
      ipconfig1 = {
        name                          = "ipconfig1"
        private_ip_address_allocation = "Dynamic"
      }
    }

    storage_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }

  }
}


kv = {
  kv1 = {
    kv_name                     = "kv-mk"
    location                    = "central india"
    rg_name                     = "rg-mk"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false
  }
}

secrets = {
  vmadminpassword = {
    length  = 16
    special = true
  }
  sqladminpassword = {
    length  = 20
    special = true
  }
}

usernames = {
  vmadminusername = "adminuser"
  sqladminusername = "sqladmin"
}

sql_servers = {
  sql1 = {
    server_name                  = "sqlserver-mk"
    rg_name                      = "rg-mk"
    location                     = "central india"
    version                      = "12.0"
    kv_name                      = "kv-mk"
    user_secret_name             = "sqladminusername"
    pwd_secret_name              = "sqladminpassword"
  }
}

sqldb = {
  sqldb1 = {
    db_name      = "sqldb-mk"
    collation    = "SQL_Latin1_General_CP1_CI_AS"
    license_type = "LicenseIncluded"
    max_size_gb  = 10
    server_name  = "sqlserver-mk"
    rg_name      = "rg-mk"
  }
}