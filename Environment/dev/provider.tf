terraform {
  required_version = ">= 1.6.0"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 4.40.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "NetworkWatcherRG"
    storage_account_name = "remotebackendstgm"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "5161c687-c32b-467f-8954-0deb54c98472"
}
