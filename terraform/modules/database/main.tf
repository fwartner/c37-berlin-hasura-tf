resource "hcloud_server" "database" {
  name        = "demo-berlin-database"
  image       = "ubuntu-20.04"
  datacenter  = var.datacenter
  server_type = var.instance_type

  ssh_keys = ["fwartner@c37mbp"]

  network {
    network_id = var.network_id
    ip         = var.internal_ip
  }

  depends_on = [
    var.network_subnet
  ]

  connection {
    type        = "ssh"
    user        = "root"
    private_key = file("~/.ssh/id_ed25519")
    host        = hcloud_server.database.ipv4_address
    agent       = false
  }

  provisioner "file" {
    source      = "./scripts/install_dependencies.sh"
    destination = "/root/install_dependencies.sh"
  }

  provisioner "file" {
    source      = "./docker/docker-compose.database.yaml"
    destination = "/root/docker-compose.yaml"
  }

  provisioner "file" {
    source      = "./dumps/create_tables.sql"
    destination = "/root/create_tables.sql"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 777 ./install_dependencies.sh",
      "./install_dependencies.sh",
      "docker compose up -d"
    ]
  }
}
