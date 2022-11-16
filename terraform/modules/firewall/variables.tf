variable "firewall_name" {
    type = string
    description = "Name of the fireall"
}

variable "firewall_ips" {
    type = list(string)
    description = "IPs of the database"
}
