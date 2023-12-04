resource "aws_dynamodb_table" "lighting" {
  attribute {
    name = "id"
    type = "N"
  }

  read_capacity  = 20
  write_capacity = 20

  name           = var.lighting_db_name
  hash_key       = "id"
}