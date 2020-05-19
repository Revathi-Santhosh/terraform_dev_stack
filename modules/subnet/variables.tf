variable "vpc_id" {
  type = string
  description = "(Required) The VPC ID."
}
variable "cidr_block" {
  type = string
  description = "(Required) The CIDR block for the subnet."
}

variable "tags" {
  type = map
  description = "(Optional) A map of tags to assign to the resource."
}
