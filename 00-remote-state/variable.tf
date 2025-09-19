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

variable "remote_state" {
  type =object({
    billing_mode = string
    hash_key = string
    attribute = object({
      name = string
      type = string
    })
  })
  default = {
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"
    attribute = {
      name = "LockID"
      type = "S"
    }
  }
}
