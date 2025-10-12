resource "aws_eks_addon" "metrics_server" {
  cluster_name = aws_eks_cluster.this.name
  addon_name   = "metrics-server"

  depends_on = [
    aws_eks_node_group.this,
    helm_release.aws_load_balancer_controller,
  ]
}
