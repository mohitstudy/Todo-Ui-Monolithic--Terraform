variable "kv" {
  type = map(object({
    kv_name                      = string
    location                     = string
    rg_name                      = string
    enabled_for_disk_encryption  = bool
    soft_delete_retention_days   = number
    purge_protection_enabled     = bool
  }))
}