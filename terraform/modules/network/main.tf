resource "hcloud_network" "network" {
  name     = var.network_name
  ip_range = var.ip_range
}

resource "hcloud_network_subnet" "network_subnet" {
  type         = "cloud"
  network_id   = hcloud_network.network.id
  network_zone = "eu-central"
  ip_range     = var.subnet_cidr_block
}
