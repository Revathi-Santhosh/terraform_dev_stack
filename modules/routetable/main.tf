resource "aws_route_table" "colossus_rt" {
  vpc_id = var.vpc_id
  tags = var.tags
}
