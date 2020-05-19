variable "cidr_block" {
  type = string
  description = "(Required) The CIDR block of the route."
}
variable "route_table_id" {
  type = string
  description = "(Required) The ID of the routing table."
}
