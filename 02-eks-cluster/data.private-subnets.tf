data "aws_subnets" "private" {
  filter {
    name   = "map-public-ip-on-launch"
    values = [true]
  }
  filter {
    name   = "tag:Project"
    values = ["eks-stack"]
  }
}
