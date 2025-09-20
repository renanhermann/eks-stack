resource "aws_eip" "nat_gateway_1a" {
  count  = var.vpc.enable_nat_gateway ? 1 : 0
  domain = "vpc"
  tags   = merge({ Name = "${var.vpc.name}-${var.vpc.elastic_ip_nat_gateway_1a}" }, var.tags)
}

resource "aws_eip" "nat_gateway_1b" {
  count  = var.vpc.enable_nat_gateway ? 1 : 0
  domain = "vpc"
  tags   = merge({ Name = "${var.vpc.name}-${var.vpc.elastic_ip_nat_gateway_1b}" }, var.tags)
}