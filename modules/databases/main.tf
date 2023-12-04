
# creating lighting database
resource "aws_dynamodb_table" "lighting" {
  attribute { # as per the microservice requirements
    name = "id"
    type = "N"
  }

  # should be enough
  read_capacity  = 20
  write_capacity = 20

  name           = var.lighting_db_name
  hash_key       = "id"
}


# creating heating database
resource "aws_dynamodb_table" "heating" {
  attribute { # as per the microservice requirements
    name = "id"
    type = "N"
  }

  # should be enough
  read_capacity  = 20
  write_capacity = 20

  name           = var.heating_db_name
  hash_key       = "id"
}