variable "hetzner_token" {
  type = string
  description = "Hetzner API token"
}

variable "instance_type_database" {
  type = string
  description = "Hetzner instance type for database"
  default = "cx11"
}

variable "instance_type_hasura" {
  type = string
  description = "Hetzner instance type for hasura"
  default = "cx11"
}

variable "firewall_ips" {
  type = list(string)
  description = "IPs to allow access to the network"
  default = [""]
}

variable "datacenter" {
  type = string
  description = "Hetzner datacenter"
  default = "nbg1-dc3"
}

variable "database_ip" {
    type = string
    description = "IP of the database instance"
}

variable "hasura_ip" {
    type = string
    description = "IP of the hasura instance"
}

variable "key_path"{
  type = string
  description = "Path to the SSH key"
  default = "~/.ssh/demo_key"
}
