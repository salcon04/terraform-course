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
      version = "4.54.0"
    }
    http = {
      source  = "hashicorp/http"
      version = "3.5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.7.2"
    }
    local = {
      source  = "hashicorp/local"
      version = "2.6.1"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.1.0"
    }
  }
}



provider "azurerm" {
  features {
  }
}