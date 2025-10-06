data "terraform_remote_state" "cluster_stack" {
  backend = "s3"
  config = {
    bucket = "tfstate-494501707223"
    key = "eks-stack/eks-cluster/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "tfstate-locking-494501707223"
  }
}