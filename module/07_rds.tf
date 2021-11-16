resource "aws_db_instance" "suuu_rds" {
  allocated_storage = var.storage_size
  storage_type = var.storage_type
  engine = var.sql_engine
  engine_version = var.mysql_version
  instance_class = var.instance_db
  name = var.name_db
  identifier = var.name_db
  username = var.username
  password = var.password
  parameter_group_name = "default.mysql8.0"
  availability_zone = var.region_instance
  db_subnet_group_name = aws_db_subnet_group.suuu_dbsb.id
  vpc_security_group_ids = [aws_security_group.suuu_sg.id]
  skip_final_snapshot = true

  tags = {
    "Name" = "${var.name}_rds"
  }
}

resource "aws_db_subnet_group" "suuu_dbsb" {
  name = "${var.name}-dbsb-group"
  subnet_ids = [aws_subnet.SUUUU_pridb[0].id,aws_subnet.SUUUU_pridb[1].id]
  tags = {
    "Name" = "${var.name}_dbsb-group"
  }
}