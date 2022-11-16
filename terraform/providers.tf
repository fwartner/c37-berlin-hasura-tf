terraform {
  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = "1.35.2"
      token = var.hetzner_token
    }
  }
}

/* provider "hcloud" {

} */
