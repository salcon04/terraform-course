terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tf-state-silvia"
    storage_account_name = "sastate49798"
    container_name       = "tf-state"
    key                  = "workspaces/terraform.tfstate"
  }


  #required_version = ">= 1.13.5"

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.54.0"
    }
  }
}



provider "azurerm" {
  features {
  }
}