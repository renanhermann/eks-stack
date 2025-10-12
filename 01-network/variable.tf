variable "region" {
  type    = string
  default = "us-east-1"
}

variable "vpc" {
  type = object({
    cidr_block                          = string
    name                                = string
    internet_gateway_name               = string
    public_route_table_name             = string
    eip_name                            = string
    private_subnet_tag_eks_cluster_name = string
    private_route_table_1a              = string
    private_route_table_1b              = string
    nat_gateway_1a                      = string
    nat_gateway_1b                      = string
    enable_nat_gateway                  = bool
    elastic_ip_nat_gateway_1a           = string
    elastic_ip_nat_gateway_1b           = string
    private_subnets = list(object({
      cidr_block              = string
      name                    = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))

    public_subnets = list(object({
      cidr_block              = string
      name                    = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))
  })
  default = {
    cidr_block                          = "10.0.0.0/24"
    name                                = "eks-vpc"
    internet_gateway_name               = "igw"
    public_route_table_name             = "public-route-table"
    eip_name                            = "eip"
    private_subnet_tag_eks_cluster_name = "eks-stack-cluster"
    private_route_table_1a              = "private-route-table-1a"
    private_route_table_1b              = "private-route-table-1b"
    nat_gateway_1a                      = "nat-1a"
    nat_gateway_1b                      = "nat-1b"
    elastic_ip_nat_gateway_1a           = "eip-nat-1a"
    elastic_ip_nat_gateway_1b           = "eip-nat-1b"
    enable_nat_gateway                  = false
    public_subnets = [{
      name                    = "public-1a"
      cidr_block              = "10.0.0.0/27"
      availability_zone       = "us-east-1a"
      map_public_ip_on_launch = true
      },
      {
        name                    = "public-1b"
        cidr_block              = "10.0.0.64/27"
        availability_zone       = "us-east-1b"
        map_public_ip_on_launch = true
    }]
    private_subnets = [{
      name                    = "private-1a"
      cidr_block              = "10.0.0.32/27"
      availability_zone       = "us-east-1a"
      map_public_ip_on_launch = false
      },
      {
        name                    = "private-1b"
        cidr_block              = "10.0.0.192/27"
        availability_zone       = "us-east-1b"
        map_public_ip_on_launch = false
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

variable "eks_cluster_name" {
  type    = string
  default = "eks-stack-cluster"
}
