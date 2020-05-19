variable "nat_gateway_id" {
  type = string
  description = " (Optional) Identifier of a VPC NAT gateway."
}
variable "route_table_id" {
  type = string
  description = "(Required) The ID of the routing table."
}
