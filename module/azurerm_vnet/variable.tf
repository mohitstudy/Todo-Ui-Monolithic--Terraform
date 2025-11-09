variable "vnets" {
    type = map(object({
        name          = string
        location      = string
        rg_name       = string
        address_space = list(string)
        subnets = map(object({
            name             = string
            address_prefixes = list(string)
        }))
    }))
}