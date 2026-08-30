resource "aws_security_group" "alb" {
  name        = "dev_asgnment_seurityg"
  description = "Sg for ALB"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "allow http traffic from internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "dev_asg_alb_sg"
  }
}
resource "aws_security_group" "app" {
  name        = "dev_asgnment_app_sg"
  description = "Sg for application server"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "allow http from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.alb.id]
  }

  egress {
    description = "allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "dev_asg_app_sg"
  }
}
resource "aws_security_group" "db" {
  name        = "dev_asgnment_db_sg"
  description = "sg for postgresql db"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "allow postgresql from application"
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.app.id]
  }

  egress {
    description = "allow outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "dev_asg_db_sg"
  }
}
