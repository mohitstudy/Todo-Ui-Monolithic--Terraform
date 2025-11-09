resource "azurerm_mssql_database" "db" {
  for_each    = var.sqldb
  name         = each.value.db_name
  server_id    = data.azurerm_mssql_server.server[each.key].id
  collation    = each.value.collation
  license_type = each.value.license_type
  max_size_gb  = each.value.max_size_gb
  sku_name     = "S0"
  enclave_type = "VBS"

  tags = {
    foo = "bar"
  }

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = false
  }
}

