resource "aws_nat_gateway" "us_east_1a" {
  count = var.vpc.enable_nat_gateway ? 1 : 0

  allocation_id = aws_eip.nat_gateway_1a[0].id
  subnet_id     = local.public_subnet_1a_id

  tags       = merge({ Name = "${var.vpc.name}-${var.vpc.nat_gateway_1a}" }, var.tags)
  depends_on = [aws_eip.nat_gateway_1a]
}

resource "aws_nat_gateway" "us_east_1b" {
  count = var.vpc.enable_nat_gateway ? 1 : 0

  allocation_id = aws_eip.nat_gateway_1b[0].id
  subnet_id     = local.public_subnet_1b_id

  tags       = merge({ Name = "${var.vpc.name}-${var.vpc.nat_gateway_1b}" }, var.tags)
  depends_on = [aws_eip.nat_gateway_1b]
}