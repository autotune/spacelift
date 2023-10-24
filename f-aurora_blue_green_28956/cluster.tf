resource "aws_rds_cluster" "default" {
  cluster_identifier = "aurora-cluster-demo2"
  availability_zones = ["us-east-1b", "us-east-1c", "us-east-1d"]
  database_name      = "mydb"
  master_username    = "foo"
  master_password    = "barbut8chars"
  engine             = "aurora-mysql"
  engine_version     = "5.7.mysql_aurora.2.12.0"
  skip_final_snapshot = true 
  db_cluster_parameter_group_name = "blue57"
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  depends_on         = [aws_rds_cluster.default]
  count              =  2 
  identifier         = "aurora-instance-${count.index}"
  cluster_identifier = aws_rds_cluster.default.cluster_identifier 
  engine             = aws_rds_cluster.default.engine
  engine_version     = aws_rds_cluster.default.engine_version
  instance_class     = "db.t3.small"
  db_parameter_group_name = "blue57instance"
}

resource "aws_rds_cluster_blue_green_deployment" "status" {
  depends_on = [ aws_rds_cluster_instance.cluster_instances ]
  cluster_identifier = aws_rds_cluster.default.cluster_identifier
  cleanup_resources = var.cleanup_resources 
  engine = aws_rds_cluster.default.engine
  switchover_enabled = var.switchover_enabled 
  create_deployment = var.create_deployment
}
