terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.70.0"
    }
  }
backend "azurerm" {
    
    resource_group_name = "rg_deepak"            
    storage_account_name = "deepakstoragepip"                             
    container_name       = "gitdemo"                              
    key = "secondday.tfstate"
  
}
}

provider "azurerm" {
  features {}
  subscription_id = "9097d0f8-4798-48d3-891f-83da77060e96"
    
  }


resource "azurerm_resource_group" "daksh9" {
  name     = "rg_daksh21"
  location = "West Europe"
}

resource "azurerm_storage_account" "deep_storage1" {
  name                     = "storagedeep45"
  resource_group_name      = azurerm_resource_group.daksh9.name
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "RAGRS"

}

resource "azurerm_storage_account" "deep_storage2" {
  name                     = "storagedeep46"
  resource_group_name      = azurerm_resource_group.daksh9.name
  location                 = "centralindia"
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_storage_account" "deep_storage3" {
  name                     = "storagedeep47"
  resource_group_name      = azurerm_resource_group.daksh9.name
  location                 = azurerm_resource_group.daksh9.location
  account_tier             = "Standard"
  account_replication_type = "GRS"

}

resource "azurerm_storage_account" "deepu_storage4" {
  depends_on = [ azurerm_resource_group.daksh9]
  name                     = "storagedeep48"
  resource_group_name      = azurerm_resource_group.daksh9.name
  location                 = "east us"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}


resource "azurerm_storage_account" "deepu_storage5" {
  name                     = "storagedeep49"
  resource_group_name      = azurerm_resource_group.daksh9.name
  location                 = azurerm_storage_account.deep_storage1.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_account" "deepu_storage8" {
  name                     = "storagedeep501"
  resource_group_name      = "rg_daksh21"
  location                 = "east us"
  account_tier             = "Standard"
  account_replication_type = "ZRS"

 
}


resource "azurerm_resource_group" "raghu" {
    name = "rg_raghu33"
    location = "east us"
}

