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