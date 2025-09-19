resource "aws_dynamodb_table" "this" {
  name = "tfstate-locking-${data.aws_caller_identity.current.account_id}"
  billing_mode = var.remote_state.billing_mode
  hash_key = var.remote_state.hash_key
  attribute {
    name = var.remote_state.attribute.name
    type = var.remote_state.attribute.type
  }
}