resource "aws_route_table_association" "public" {
  for_each       = { for idx, subnet in aws_subnet.public : idx => subnet if length(var.public_subnets) >= 1 }
  subnet_id      = aws_subnet.public[each.key].id
  route_table_id = aws_route_table.public[0].id
}

resource "aws_route_table_association" "private" {
  for_each       = { for idx, subnet in aws_subnet.private : idx => subnet if length(var.private_subnets) >= 1 }
  subnet_id      = aws_subnet.private[each.key].id
  route_table_id = aws_route_table.private[0].id
}
