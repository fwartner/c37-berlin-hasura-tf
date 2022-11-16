variable "network_name" {
    type = string
    description = "Name of the network"
}

variable "subnet_cidr_block" {
  description = "CIDR block for the subnet"
  type        = string
  default     = "10.2.0.0/24"
}

variable "ip_range" {
  description = "IP range of the network"
  type        = string
  default     = "10.2.0.0/16"
}

variable "datacenter" {
  type = string
  description = "Hetzner datacenter"
  default = "nbg1-dc3"
}
