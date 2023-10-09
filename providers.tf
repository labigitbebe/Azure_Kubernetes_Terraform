terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.75.0"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.4.0"
    }
  }
}

provider "azurerm" {

  subscription_id = "e982e610-597b-47d1-8e57-095xxxxxxxx"
  tenant_id       = "ff706692-ae99-4fba-aa64-01fxxxxxxxx"
  client_id       = "50a5e942-83ce-480f-b689-a9xxxxxxxxx"
  client_secret   = "6S98Q~vfnn9h5nsD5Vexxxxxxxx"

  features {

  }
}