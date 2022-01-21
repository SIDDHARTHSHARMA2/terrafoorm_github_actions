resource "azurerm_app_service_plan" "example" {
  name                = var.app_service_plan
  location            = data.azurerm_resource_group.cloudinit.location
  resource_group_name = data.azurerm_resource_group.cloudinit.name 
  kind                = "Linux"
  reserved            = true

  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service_source_control_token" "example" {
  type  = "GitHub"
  token = "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"
}

resource "azurerm_app_service" "example" {
  name                = var.app_service
  location            = data.azurerm_resource_group.cloudinit.location
  resource_group_name = data.azurerm_resource_group.cloudinit.name 
  app_service_plan_id = azurerm_app_service_plan.example.id
 

  site_config {
    dotnet_framework_version = "v4.0"
   
    
    
  }
  app_settings = {
    "SOME_KEY" = "some-value"
  }

  connection_string  {
    name  = "Database"
    type  = "PostgreSQL"
    value = var.connection_string
  }
}
resource "azurerm_app_service_plan" "example2" {
  name                = var.app_service_plan2
  location            = data.azurerm_resource_group.cloudinit.location
  resource_group_name = data.azurerm_resource_group.cloudinit.name 
  kind                = "Windows"
  reserved            = false

  sku {
    tier     = "Free"
    size     = "F1"
    capacity = 0
  }
}
resource "azurerm_app_service" "example2" {
  name                = var.app_service2
  location            = data.azurerm_resource_group.cloudinit.location
  resource_group_name = data.azurerm_resource_group.cloudinit.name 
  app_service_plan_id = azurerm_app_service_plan.example2.id

  site_config {
      # Free tier only supports 32-bit
    use_32_bit_worker_process = true
    # Run "az webapp list-runtimes" for current supported values, but always
    # output the value of process.version from a running app because you might
    # not get the version you expect
    windows_fx_version = "node|12-lts"

  }
 
  app_settings = {
    WEBSITE_NODE_DEFAULT_VERSION = "12.13.0"
  }

}

resource "azurerm_app_service_virtual_network_swift_connection" "example" {
  app_service_id = azurerm_app_service.example.id
  subnet_id      = azurerm_subnet.example.id
}