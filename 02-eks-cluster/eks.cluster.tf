resource "aws_eks_cluster" "this" {
  name                      = var.eks_cluster.name
  enabled_cluster_log_types = var.eks_cluster.enabled_cluster_log_types
  role_arn                  = aws_iam_role.eks_cluster.arn
  version                   = var.eks_cluster.version

  access_config {
    authentication_mode = var.eks_cluster.access_config.authentication_mode
  }

  vpc_config {
    subnet_ids = data.aws_subnets.private.ids
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSClusterPolicy,
  ]
}

