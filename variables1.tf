
variable "jump_ingress_rules" {
  type = map(map(any))
  default = {
    rule1 = { from = 22, to = 22, proto = "tcp", cidr = "114.143.194.146/32", desc = "Skyone" }
    rule2 = { from = 22, to = 22, proto = "tcp", cidr = "49.248.109.190/32", desc = "Skyone" }
    rule3 = { from = 22, to = 22, proto = "tcp", cidr = "14.141.39.130/32", desc = "Skyone" }
    rule4 = { from = 0, to = 0, proto = "-1", cidr = "172.17.0.0/16", desc = "Internal Network" }
    rule5 = { from = 0, to = 0, proto = "-1", cidr = "0.0.0.0/0", desc = "Internet This should not be added, but for testing" }
  }
}

variable "jump_egress_rules" {
  type = map(map(any))
  default = {
    rule1 = { from = 0, to = 0, proto = -1, cidr = "0.0.0.0/0", desc = "Allow All Outbound" }
  }
}
