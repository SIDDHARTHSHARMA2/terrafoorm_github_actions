terraform {
  required_version = ">= 0.14.3"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.44.0"
    }
  }
}

provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "cloudinit" {
  name = var.resource_group_name

}
#backend
terraform {
  backend "azurerm" {
    resource_group_name  = "your-resource-group"
    storage_account_name = "yourstorageaccount123"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

