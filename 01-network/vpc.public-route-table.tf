resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  tags = { Name = "${var.vpc.name}-${var.vpc.public_route_table_name}" }
  depends_on = [aws_vpc.this]
}

resource "aws_route_table_association" "public" {
  count = length(var.vpc.public_subnets)

  subnet_id = aws_subnet.publics[count.index].id
  route_table_id = aws_route_table.public.id

  depends_on = [aws_subnet.publics, aws_route_table.public]
}