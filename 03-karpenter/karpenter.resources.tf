resource "terraform_data" "karpenter_resources" {
    provisioner "local-exec" {
        command = "bash ./cli/karpenter-resources-create.sh"
        when = create
        environment = {
            REGION = var.region
            CLUSTER_NAME = local.eks_cluster
            KARPENTER_NODE_ROLE = local.karpenter_node_role_name
        }
    }
    depends_on = [
        helm_release.karpenter,
    ]
}