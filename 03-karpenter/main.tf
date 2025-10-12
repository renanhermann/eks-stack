provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = var.tags
  }
}

provider "helm" {
  kubernetes = {
    host                   = local.eks_cluster_endpoint
    cluster_ca_certificate = base64decode(local.eks_cluster_certificate_authority_data) 
    exec = {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name",  local.eks_cluster]
      command     = "aws"
    }
  }
}

