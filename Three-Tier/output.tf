# id - The ID of the MySQL Server.
output "id_mysql_server" {
    value = azurerm_mysql_server.mysql_server.id
}

# id - The ID of the MySQL Database.
output "id_mysql_database" {
    value = azurerm_mysql_database.mysql_db.id
}
# id - The ID of the MySQL Firewall Rule.
output "id_mysql_firewall" {
  value = azurerm_mysql_firewall_rule.ASG.id
}

