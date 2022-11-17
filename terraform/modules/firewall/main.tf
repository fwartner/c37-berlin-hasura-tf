terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.35.2"
    }
  }
}

resource "hcloud_firewall" "firewall" {
  name = var.firewall_name
  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "8080"
    source_ips = [
      "0.0.0.0/0",
      "::/0",
    ]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "5432"
    source_ips = [
      "90.187.195.137/32"
    ]
  }

  rule {
    direction = "in"
    protocol  = "tcp"
    port      = "22"
    source_ips = [
      "90.187.195.137/32"
    ]
  }

  /* rule {
    direction = "in"
    protocol  = "tcp"
    port      = "22"
    source_ips = [
      "90.187.195.137/32"
    ]
  } */
}
