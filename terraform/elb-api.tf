resource "aws_alb" "elb-api" {
  name = "elb-api"
  subnets = [aws_subnet.main-private-1.id, aws_subnet.main-private-2.id]
  security_groups = [aws_security_group.api-elb-securitygroup.id]
  internal           = true

}
resource "aws_alb_target_group" "api-target-group" {
  name = "api-target-group"
  port = var.API_PORT
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path = "/"
    port = "80"
    healthy_threshold = 5
    unhealthy_threshold = 2
    timeout = 5
    interval = 30
    matcher = "200"
  }
}

resource "aws_lb_listener" "api-listener-80" {
  load_balancer_arn = aws_alb.elb-api.arn
  port              = var.API_PORT
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_alb_target_group.api-target-group.arn
    }
  }
