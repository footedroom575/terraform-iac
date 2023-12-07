variable "db_names" {
  type        = list(string)
  description = "Names of DynamoDB tables to create. PS: number of tables depend on length of this list."
}
