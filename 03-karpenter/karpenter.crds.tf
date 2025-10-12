resource "terraform_data" "karpenter_crds" {
    provisioner "local-exec" {
        command = "bash ./cli/karpennter-crds-create.sh"
        when = create
        environment = {
            REGION = var.region
            CLUSTER_NAME = local.eks_cluster
        }
    }
}