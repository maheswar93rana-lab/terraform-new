variable "rgs" {
  type        = map(any)
  description = "Map of Resource Groups"
}

variable "vnets" {
  type        = map(any)
  description = "Map of Virtual Networks"
}

variable "subnets" {
  type        = map(any)
  description = "Map of Subnets"
}

variable "pips" {
  type        = map(any)
  description = "Map of Public IPs"
}

variable "vms" {
  type        = map(any)
  description = "Map of Virtual Machines"
}

variable "lbs" {
  type        = map(any)
  description = "Map of Load Balancers"
}

variable "appgws" {
  type        = map(any)
  description = "Map of Application Gateways"
}

variable "bastions" {
  type        = map(any)
  description = "Map of Azure Bastion Hosts"
}

variable "peerings" {
  type        = map(any)
  description = "Map of VNet Peerings"
}
