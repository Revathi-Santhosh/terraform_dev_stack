resource "aws_vpc" "colossus_vpc" {
  cidr_block = var.cidr_block
  instance_tenancy = var.instance_tenancy
  tags = var.tags
}
