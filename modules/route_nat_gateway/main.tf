resource "aws_route" "colossus_rt_nat" {
  route_table_id  = var.route_table_id
  nat_gateway_id = var.nat_gateway_id
}
