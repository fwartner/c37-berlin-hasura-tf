
module "network" {
  source       = "./modules/network"
  network_name = "hasura_demo_network"
  datacenter   = var.datacenter
}

module "database" {
  source         = "./modules/database"
  network_id     = module.network.network_id
  network_subnet = module.network.subnet_id
  datacenter     = var.datacenter
  internal_ip    = var.database_ip
  ssh_keys       = ["fwartner@c37mbp"]
}

module "hasura" {
  source         = "./modules/hasura"
  network_id     = module.network.network_id
  network_subnet = module.network.subnet_id
  datacenter     = var.datacenter
  internal_ip    = var.hasura_ip
  ssh_keys       = ["fwartner@c37mbp"]
  depends_on     = [
    module.database
  ]
}

module "firewall" {
  source        = "./modules/firewall"
  firewall_name = "hasura_demo_firewall"
  firewall_ips  = var.firewall_ips
}

resource "hcloud_firewall_attachment" "firewall" {
  firewall_id = module.firewall.firewall_id
  server_ids  = [module.database.instance_id, module.hasura.instance_id]
  depends_on = [
    module.database,
    module.hasura,
    module.firewall
  ]
}
