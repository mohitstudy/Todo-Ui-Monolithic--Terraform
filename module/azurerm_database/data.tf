data "azurerm_mssql_server" "server" {
  for_each = var.sqldb
  name                = each.value.server_name
  resource_group_name = each.value.rg_name
}