resource "aws_ec2_tag" "cluster_security_group" {
  resource_id = local.eks_cluster_security_group_id
  key         = "karpenter.sh/discovery"
  value       = local.eks_cluster  # Replace with actual cluster name
}