output "kv_id" {
  value       = values(azurerm_key_vault.key_vault)[0].id   
  sensitive   = true
}