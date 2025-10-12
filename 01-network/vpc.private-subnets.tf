resource "aws_subnet" "privates" {
  count = length(var.vpc.private_subnets)

  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.vpc.private_subnets[count.index].cidr_block
  availability_zone       = var.vpc.private_subnets[count.index].availability_zone
  map_public_ip_on_launch = var.vpc.private_subnets[count.index].map_public_ip_on_launch

  tags = merge(
    {
      Name                     = "${var.vpc.name}-${var.vpc.private_subnets[count.index].name}"
      "karpenter.sh/discovery" = var.eks_cluster_name
    },
    var.tags
  )
  depends_on = [aws_vpc.this]
}
