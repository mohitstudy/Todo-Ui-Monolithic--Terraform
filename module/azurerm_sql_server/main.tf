resource "azurerm_mssql_server" "server" {
    for_each = var.sql_servers
  name                         = each.value.server_name
  resource_group_name          = each.value.rg_name
  location                     = each.value.location
  version                      = each.value.version
  administrator_login          = data.azurerm_key_vault_secret.username[each.key].value
  administrator_login_password = data.azurerm_key_vault_secret.password[each.key].value

  tags = {
    environment = "production"
  }
}



