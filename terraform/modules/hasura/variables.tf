variable "instance_type" {
  type = string
  description = "Hetzner instance type"
  default = "cx11"
}

variable "datacenter" {
  type = string
  description = "Hetzner datacenter"
  default = "nbg1-dc3"
}

variable "network_id" {
    type = string
    description = "ID of the network"
}

variable "network_subnet" {
    type = string
    description = "ID of the subnet"
}

variable "internal_ip" {
    type = string
    description = "Internal IP of the instance"
}

variable "ssh_keys" {
    type = list(string)
    description = "SSH keys to add to the instance"
}
