resource "aws_alb" "elb-web" {
  name = "elb-web"
  subnets = [aws_subnet.main-public-1.id, aws_subnet.main-public-2.id]
  security_groups = [aws_security_group.web-elb-securitygroup.id]
  internal           = false
}

resource "aws_alb_target_group" "web-target-group" {
  name = "web-target-group"
  port = var.WEB_PORT
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path = "/"
    port = var.WEB_PORT
    healthy_threshold = 5
    unhealthy_threshold = 2
    timeout = 5
    interval = 30
    matcher = "200"
  }

}

resource "aws_lb_listener" "web-listener-80" {
  load_balancer_arn = aws_alb.elb-web.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_listener" "web-listener-443" {
  load_balancer_arn = aws_alb.elb-web.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:us-east-1:426938191125:certificate/c7b34630-2570-4373-848d-d5b1dfac47ce"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.web-target-group.arn
  }
}
