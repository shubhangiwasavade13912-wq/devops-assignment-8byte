resource "aws_db_subnet_group" "main" {
  name = "dev_asg_rds_subnet_group"

  subnet_ids = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id
  ]

  tags = {
    Name = "dev_asg_rds_subnet_group"
  }
}
resource "aws_db_instance" "postgres" {
  identifier = "dev-asg-postgres-db"

  engine         = "postgres"
  engine_version = "17"

  instance_class    = "db.t3.micro"
  allocated_storage = 20
  storage_type      = "gp3"

  db_name  = "devdb"
  username = var.db_username
  password = var.db_password

  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [aws_security_group.db.id]

  publicly_accessible = false

  multi_az = false

  skip_final_snapshot = true

  tags = {
    Name = "dev_asg_postgres_db"
  }
}