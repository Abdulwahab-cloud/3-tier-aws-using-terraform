resource "aws_lb_target_group" "web-target-group" {
  name        = "web-tgroup"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = aws_vpc.vpc.id
health_check {
    enabled             = true
    interval            = 10
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_autoscaling_attachment" "webauto" {
  autoscaling_group_name = aws_autoscaling_group.web.id
  lb_target_group_arn    = aws_lb_target_group.web-target-group.arn
}

resource "aws_lb" "application-lb-web" {
  name               = "web-alb"
  internal           = false
  load_balancer_type = "application"
  subnets           = [aws_subnet.public1.id , aws_subnet.public2.id]
  security_groups    = [aws_security_group.web.id]
  ip_address_type    = "ipv4"
  tags = {
    name = "WebApp-Alb"
  }
}

resource "aws_lb_listener" "alb-listener" {
  load_balancer_arn = aws_lb.application-lb-web.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web-target-group.arn
  }
}