output "network_id" {
  value = hcloud_network.network.id
}

output "subnet_id" {
  value = hcloud_network_subnet.network_subnet.id
}
