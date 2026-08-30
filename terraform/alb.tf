resource "aws_alb" "app" {
  name               = "dev-asgnment-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.alb.id]
  subnets = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]

  tags = {
    Name = "dev_asgnment_alb"
  }
}
resource "aws_alb_target_group" "app" {
  name     = "dev-asgnment-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path     = "/"
    protocol = "HTTP"
    port     = "traffic-port"
  }

  tags = {
    Name = "dev_asgnment_tg"
  }
}
resource "aws_lb_listener" "app" {
  load_balancer_arn = aws_alb.app.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.app.arn
  }
}
resource "aws_alb_target_group_attachment" "app" {
  target_group_arn = aws_alb_target_group.app.arn
  target_id        = aws_instance.app.id
  port             = 80
}