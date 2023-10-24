resource "aws_db_parameter_group" "test" {
  name   = "blue57cluster"
  family = "aurora-mysql5.7"
 }

resource "aws_rds_cluster_parameter_group" "test" {
  name        = "rds-cluster-pg"
  family      = "aurora-mysql5.7"
  description = "RDS default cluster parameter group"

  parameter {
    name  = "binlog_format"
    value = "ROW"
    apply_method = "pending-reboot"
  }
}
