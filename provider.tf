terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=5.0.0"
    }
  }

  backend "azurerm" {
    use_azuread_auth     = true
    use_oidc             = true
    storage_account_name = "terrastatesacc"
    container_name       = "tfstate"
    key                  = "terra-learn.tfstate"
  }
}

provider "azurerm" {
  features {}
}
