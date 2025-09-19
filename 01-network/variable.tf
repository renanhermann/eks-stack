variable "region" {
  type    = string
  default = "us-east-1"
}

variable "vpc" {
  type = object({
    cidr_block            = string
    name                  = string
    internet_gateway_name = string
    public_route_table_name = string
    public_subnets = list(object({
      cidr_block = string
      name = string
      availability_zone = string
      map_public_ip_on_launch = bool
    }))
  })
  default = {
    cidr_block            = "10.0.0.0/24"
    name                  = "eks-vpc"
    internet_gateway_name = "igw"
    public_route_table_name = "public-route-table"
    public_subnets = [{
      name = "eks-public-subnet-1"
      cidr_block = "10.0.0.0/27"
      availability_zone = "us-east-1a"
      map_public_ip_on_launch = true
    },
    { 
      name = "eks-public-subnet-2"
      cidr_block = "10.0.0.64/27"
      availability_zone = "us-east-1b"
      map_public_ip_on_launch = true
    }]
  }
}

variable "tags" {
  type = map(string)
  default = {
    ManagedBy = "terraform"
    Project   = "eks-stack"
  }
}

