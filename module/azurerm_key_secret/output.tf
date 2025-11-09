output "password_secret_ids" {
  description = "Map of all password secret IDs"
  value       = { for key, secret in azurerm_key_vault_secret.passwords : key => secret.id }
  sensitive   = true
}

output "username_secret_ids" {
  description = "Map of all username secret IDs"
  value       = { for key, secret in azurerm_key_vault_secret.usernames : key => secret.id }
  sensitive   = true
}