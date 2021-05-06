resource "azurerm_sql_server" "example" {
  name                         = var.sql_server_name
  resource_group_name          = azurerm_resource_group.example.name
  location                     = var.location
  version                      = var.sql_server_version
  administrator_login          = var.sql_server_admin_login
  administrator_login_password = var.sql_server_admin_password

  tags = {
    environment = var.sql_server_tags
  }
}

resource "azurerm_private_endpoint" "endpoint" {
  name                         = var.private_endpoint_name
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  subnet_id                    = azurerm_subnet.vm.id

  private_service_connection {
    is_manual_connection           = false
    name                           = var.private_endpoint_connection_name
    private_connection_resource_id = azurerm_sql_server.example.id
    subresource_names              = ["sqlServer"]
  }
}

resource "azurerm_storage_account" "example" {
  name                     = var.sql_server_storage_account_name
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = var.sql_server_storage_account_tier
  account_replication_type = var.sql_server_storage_account_type
}

resource "azurerm_sql_database" "example" {
  name                = var.sql_db_name
  resource_group_name = azurerm_resource_group.example.name
  location            = var.location
  server_name         = azurerm_sql_server.example.name

  extended_auditing_policy {
    storage_endpoint                        = azurerm_storage_account.example.primary_blob_endpoint
    storage_account_access_key              = azurerm_storage_account.example.primary_access_key
    storage_account_access_key_is_secondary = true
    retention_in_days                       = 6
  }



  tags = {
    environment = var.sql_db_tags
  }
}