output "database_ip" {
  value = module.database.ipv4_address
}

output "hasura_ip" {
  value = module.hasura.ipv4_address
}
