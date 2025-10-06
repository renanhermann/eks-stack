variable "region" {
  type        = string
  description = "The region to deploy the S3 bucket"
  default     = "us-east-1"
}

variable "tags" {
  type        = map(string)
  description = "The tags to deploy the S3 bucket"
  default     = {
    ManagedBy = "terraform"
    Project   = "eks-stack"
  }
}

variable "karpenter" {
  type = object({
    controller_role_name = string
    controller_policy_name = string
  })
  default = {
    controller_role_name = "karpenter-controller-role"
    controller_policy_name = "karpenter-controller-policy"
  }
}