### APP.MANNYURBANO - PUBLIC

resource "aws_route53_record" "app" {
  zone_id = "Z03628411DFCR8STUKXFK"
  name    = "app.mannyurbano.com"
  type    = "A"

  alias {
    name                   = aws_alb.elb-web.dns_name
    zone_id                = aws_alb.elb-web.zone_id
    evaluate_target_health = false
  }
}

### BACKEND.APP.MANNYURBANO - PRIVATE
  
resource "aws_route53_record" "backend" {
  zone_id = "Z06527112UPFNG74RKEP9"
  name    = "backend.app.mannyurbano.com"
  type    = "A"

  alias {
    name                   = aws_alb.elb-api.dns_name
    zone_id                = aws_alb.elb-api.zone_id
    evaluate_target_health = false
  }
}

