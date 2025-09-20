variable "region" {
  type    = string
  default = "us-east-1"
}

variable "tags" {
  type = map(string)
  default = {
    ManagedBy = "terraform"
    Project   = "eks-stack"
  }
}

variable "eks_cluster" {
  type = object({
    name = string
    role_name = string
    version = string
    enabled_cluster_log_types = list(string)
    access_config = object({
      authentication_mode = string
    })
    subnet_ids = list(string)
  })
  default = {
    name = "eks-stack-cluster"
    role_name = "eks-stack-cluster-role"
    version = "1.33"
    enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
    access_config = {
      authentication_mode = "API_AND_CONFIG_MAP"
    }
    subnet_ids = []
  }
}