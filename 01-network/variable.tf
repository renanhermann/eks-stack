variable "region" {
  type    = string
  default = "us-east-1"
}

variable "vpc" {
  type = object({
    cidr_block            = string
    name                  = string
    internet_gateway_name = string
  })
  default = {
    cidr_block            = "10.0.0.0/24"
    name                  = "eks-vpc"
    internet_gateway_name = "igw"
  }
}

variable "tags" {
  type = map(string)
  default = {
    ManagedBy = "terraform"
    Project   = "eks-stack"
  }
}

