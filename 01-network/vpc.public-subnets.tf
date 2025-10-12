resource "aws_subnet" "publics" {
  count = length(var.vpc.public_subnets)

  vpc_id = aws_vpc.this.id
  cidr_block = var.vpc.public_subnets[count.index].cidr_block
  availability_zone = var.vpc.public_subnets[count.index].availability_zone
  map_public_ip_on_launch = var.vpc.public_subnets[count.index].map_public_ip_on_launch
  
  tags = merge(
    {
      Name                     = "${var.vpc.name}-${var.vpc.public_subnets[count.index].name}"
      "kubernetes.io/role/elb" = "1"
      "karpenter.sh/discovery" = var.eks_cluster_name
    },
    var.tags
  )
  depends_on = [aws_vpc.this]
}

