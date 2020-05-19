variable "gateway_id" {
  type = string
  description = "(Optional) Identifier of a VPC internet gateway or a virtual private gateway."
}
variable "route_table_id" {
  type = string
  description = "(Required) The ID of the routing table."
}
variable "destination_cidr_block" {
  type = string
  description = " (Optional) The destination CIDR block."
}
