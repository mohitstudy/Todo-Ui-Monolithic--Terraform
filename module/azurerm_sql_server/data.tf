data "azurerm_key_vault" "kv" {
  for_each = var.sql_servers
  name                = each.value.kv_name
  resource_group_name = each.value.rg_name
}

data "azurerm_key_vault_secret" "username" {
  for_each = var.sql_servers
  name         = each.value.user_secret_name
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

data "azurerm_key_vault_secret" "password" {
  for_each = var.sql_servers
  name         = each.value.pwd_secret_name
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}