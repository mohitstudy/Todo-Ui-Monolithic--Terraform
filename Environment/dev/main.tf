module "rg" {
  source = "../../module/azurerm_rg"
    rgs    = var.rgs
}

module "vnet" {
    depends_on = [module.rg]
    source = "../../module/azurerm_vnet"
    vnets  = var.vnets
}

module "pip" {
    depends_on = [module.rg]
    source = "../../module/azurerm_pip"
    pips   = var.pips
}

module "vm" {
    depends_on = [module.vnet, module.pip , module.kv]
    source = "../../module/azurerm_vm"
    vms    = var.vms   
}


module "kv" {
  depends_on = [module.rg]
  source = "../../module/azurerm_kv"
  kv     = var.kv
}

module "key_secret" {
  depends_on = [module.kv]
  source     = "../../module/azurerm_key_secret"
  kv_id      = module.kv.kv_id
  secrets    = var.secrets
  usernames  = var.usernames
}


module "sql_server" {
    depends_on = [module.kv]
    source = "../../module/azurerm_sql_server"
    sql_servers = var.sql_servers
}


module "sqldb" {
    depends_on = [module.sql_server]
  source = "../../module/azurerm_database"
  sqldb = var.sqldb
}
