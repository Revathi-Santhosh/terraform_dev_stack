resource "aws_route" "colossus_rt_cidr" {
  route_table_id =var.route_table_id
  cidr_block = var.cidr_block
}
