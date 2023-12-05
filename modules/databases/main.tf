
# creating database
resource "aws_dynamodb_table" "databases" {
  count = length(var.db_names)
  attribute { # as per the microservice requirements
    name = "id"
    type = "N"
  }

  # should be enough
  read_capacity  = 20
  write_capacity = 20

  name     = var.db_names[count.index]
  hash_key = "id"
}