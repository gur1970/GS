terraform {
  required_version = ">=0.12"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
    null = {
      source = "hashicorp/null"
    }
    azapi = {
        source="azure/azapi"
        version = "~>1.5"
    }
    random = {
        source="hashicorp/random"
        #version = "~>1.5"
    }
  }
   backend "azurerm" {
    resource_group_name   = "terraform-storage-rg"
    storage_account_name  = "gsterraforms3"
    container_name        = "tfstate"
    key                   = "project.tfstate"
  } 
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  skip_provider_registration = true # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}