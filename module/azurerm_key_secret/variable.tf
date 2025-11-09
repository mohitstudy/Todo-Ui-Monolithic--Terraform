variable "secrets" {
  description = "Map of password secrets configuration"
  type = map(object({
    length  = number
    special = bool
  }))
}

variable "usernames" {
  description = "Map of usernames to store as secrets in Key Vault"
  type        = map(string)
}


variable "kv_id" {
  description = "The ID of the Key Vault where secrets will be stored"
  type        = string
}