resource "aws_lb" "app_lb" {
  name               = "app-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [module.network.lb_security_group_id]
  subnets            = var.subnet_ids

  enable_deletion_protection = false
}

resource "aws_lb_target_group" "app_tg" {
  name        = "app-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "instance"

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
    interval            = 30
    path                = "/"
  }
}

resource "aws_lb_listener" "app_lb_listener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "app_tg_attachment" {
  count            = length(var.target_ids)
  target_group_arn = aws_lb_target_group.app_tg.arn
  target_id        = element(var.target_ids, count.index)
  port             = 80
}

output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = aws_lb.app_lb.dns_name
}
