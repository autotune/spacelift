resource "aws_db_parameter_group" "default-mysql" {
    name        = "aurora-mysql80"
    family      = "aurora-mysql8.0"
    description = "Default parameter group for postgres9.6"
}
