output "arn" {
  value = aws_vpc.colossus_vpc.arn
}

output "id" {
  value = aws_vpc.colossus_vpc.id
}

output "default_network_acl_id" {
  value = aws_vpc.colossus_vpc.default_network_acl_id
}

output "default_security_group_id" {
  value = aws_vpc.colossus_vpc.default_security_group_id
}
