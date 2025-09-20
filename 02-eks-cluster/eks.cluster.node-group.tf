resource "aws_eks_node_group" "this" {
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = var.eks_cluster.node_group.name
  node_role_arn   = aws_iam_role.eks_stack_node_group_role.arn
  subnet_ids      = data.aws_subnets.private.ids
  instance_types  = var.eks_cluster.node_group.instance_types
  capacity_type   = var.eks_cluster.node_group.capacity_type
  ami_type        = var.eks_cluster.node_group.ami_type


  scaling_config {
    desired_size = var.eks_cluster.node_group.scaling_config.desired_size
    max_size     = var.eks_cluster.node_group.scaling_config.max_size
    min_size     = var.eks_cluster.node_group.scaling_config.min_size
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_stack_node_group_role-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks_stack_node_group_role-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks_stack_node_group_role-AmazonEC2ContainerRegistryReadOnly,
  ]
}
