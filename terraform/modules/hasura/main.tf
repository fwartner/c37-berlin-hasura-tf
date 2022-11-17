terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.35.2"
    }
  }
}

resource "hcloud_server" "hasura" {
  name        = "demo-berlin-hasura"
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
    host        = hcloud_server.hasura.ipv4_address
    agent       = false
  }

  provisioner "file" {
    source      = "./scripts/install_dependencies.sh"
    destination = "/root/install_dependencies.sh"
  }

  provisioner "file" {
    source      = "./docker/docker-compose.hasura.yaml"
    destination = "/root/docker-compose.yaml"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod 777 ./install_dependencies.sh",
      "./install_dependencies.sh",
      "docker compose up -d"
    ]
  }
}
