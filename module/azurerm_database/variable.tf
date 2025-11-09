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