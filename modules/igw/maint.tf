resource "aws_internet_gateway" "colossus_igw" {
  vpc_id = var.vpc_id
}
