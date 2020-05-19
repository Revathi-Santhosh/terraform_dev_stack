variable "vpc_id" {
  type = string
  description = "(Required) The VPC ID."
}
variable "tags" {
  type = map
  description = " (Optional) A map of tags to assign to the resource."
}
