terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.8.0"
    }
  }
  backend "s3" {
    bucket         = "tfstate-494501707223"
    key            = "eks-stack/karpenter/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "tfstate-locking-494501707223"
  }
}

