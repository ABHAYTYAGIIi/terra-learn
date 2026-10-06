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
    tenant_id            = "e8608a5e-0de5-448a-a6bb-512358983068"
    client_id            = "c814e22f-36d9-4a7b-a93b-364134cbb113"
    storage_account_name = "terrastatesacc"
    container_name       = "tfstate"
    key                  = "terra-learn.tfstate"
  }
}

provider "azurerm" {
  features {}
}
