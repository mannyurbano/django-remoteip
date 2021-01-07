### PUBLIC

resource "aws_route53_record" "app" {
  zone_id = "id"
  name    = "fqdn"
  type    = "A"

  alias {
    name                   = aws_alb.elb-web.dns_name
    zone_id                = aws_alb.elb-web.zone_id
    evaluate_target_health = false
  }
}

### PRIVATE
  
resource "aws_route53_record" "backend" {
  zone_id = "id"
  name    = "fqdn"
  type    = "A"

  alias {
    name                   = aws_alb.elb-api.dns_name
    zone_id                = aws_alb.elb-api.zone_id
    evaluate_target_health = false
  }
}

