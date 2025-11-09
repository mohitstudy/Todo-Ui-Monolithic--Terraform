resource "random_password" "vm_pwd" {
  for_each = var.secrets
  length   = each.value.length
  special  = each.value.special
}

resource "azurerm_key_vault_secret" "passwords" {
  for_each     = var.secrets
  name         = each.key          
  value        = random_password.vm_pwd[each.key].result
  key_vault_id = var.kv_id

  lifecycle {
    ignore_changes = [value]              # Don't recreate if value changes
    create_before_destroy = true          # Create new version first
  }
}

resource "azurerm_key_vault_secret" "usernames" {
  for_each     = var.usernames
  name         = each.key                          
  value        = each.value
  key_vault_id = var.kv_id

  lifecycle {
    ignore_changes = [value]              # Don't recreate if value changes
    create_before_destroy = true          # Create new version first
  }
}

