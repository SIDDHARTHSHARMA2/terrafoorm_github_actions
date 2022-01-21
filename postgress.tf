resource "azurerm_postgresql_server" "example" {
  name                = var.postgresql
  location            = data.azurerm_resource_group.cloudinit.location
  resource_group_name = data.azurerm_resource_group.cloudinit.name

  sku_name = "GP_Gen5_2"

  storage_profile {
    storage_mb            = 5120
    backup_retention_days = 7
    geo_redundant_backup  = "Disabled"
  }

  administrator_login          = var.login
  administrator_login_password = var.password
  version                      = "9.5"
  ssl_enforcement              = "Enabled"
}

resource "azurerm_postgresql_virtual_network_rule" "example" {
  name                                 = "postgresql-vnet-rule"
  resource_group_name                  = data.azurerm_resource_group.cloudinit.name
  server_name                          = azurerm_postgresql_server.example.name
  subnet_id                            = azurerm_subnet.example.id 
  ignore_missing_vnet_service_endpoint = true
}
resource "azurerm_postgresql_database" "example" {
  name                = var.postgresql_database
  resource_group_name = data.azurerm_resource_group.cloudinit.name
  server_name         = azurerm_postgresql_server.example.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
