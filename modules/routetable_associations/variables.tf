variable "subnet_id" {
  type = string
  description = "(Optional) The subnet ID to create an association. Conflicts with gateway_id."
}



variable "route_table_id" {
  type = string
  description = "(Required) The ID of the routing table to associate with."
}
