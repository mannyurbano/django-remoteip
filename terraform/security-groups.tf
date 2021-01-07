### WEB ELB ###

resource "aws_security_group_rule" "web-elb-securitygroup-rule-2" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web-elb-securitygroup.id
}

resource "aws_security_group_rule" "web-elb-securitygroup-rule-3" {
  type              = "ingress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web-elb-securitygroup.id
}

resource "aws_security_group_rule" "web-elb-securitygroup-rule-4" {
  type              = "ingress"
  from_port = -1
  to_port = -1
  protocol = "icmp"
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.web-elb-securitygroup.id
}

resource "aws_security_group" "web-elb-securitygroup" {
  vpc_id = aws_vpc.main.id
  name = "web-elb"
  description = "security group for load balancer"

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
 
  tags = {
    Name = "web-elb"
  }
}


### API ELB ###

resource "aws_security_group_rule" "api-elb-securitygroup-rule-1" {
  type              = "ingress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  source_security_group_id = aws_security_group.web-instance-securitygroup.id
  security_group_id = aws_security_group.api-elb-securitygroup.id
}

resource "aws_security_group_rule" "api-elb-securitygroup-rule-2" {
  type              = "ingress"
  from_port = -1
  to_port = -1
  protocol = "icmp"
  cidr_blocks = ["10.0.0.0/16"]
  security_group_id = aws_security_group.api-elb-securitygroup.id
}

resource "aws_security_group" "api-elb-securitygroup" {
  vpc_id = aws_vpc.main.id
  name = "api-elb"
  description = "security group for load balancer"
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "api-elb"
  }
}


### WEB EC2 ###

resource "aws_security_group_rule" "web-instance-securitygroup-rule-1" {
  type              = "ingress"
  from_port         = var.WEB_PORT
  to_port           = var.WEB_PORT
  protocol          = "tcp"
  source_security_group_id = aws_security_group.web-elb-securitygroup.id
  security_group_id = aws_security_group.web-instance-securitygroup.id
}

resource "aws_security_group_rule" "web-instance-securitygroup-rule-4" {
  type              = "ingress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["10.0.0.0/16"]
  security_group_id = aws_security_group.web-instance-securitygroup.id
}

resource "aws_security_group" "web-instance-securitygroup" {
  vpc_id = aws_vpc.main.id
  name = "web-instance"
  description = "security group that allows all egress traffic"
  
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-instance"
  }
}


### API EC2 ###

resource "aws_security_group_rule" "api-instance-securitygroup-rule-1" {
  type              = "ingress"
  from_port         = var.API_PORT
  to_port           = var.API_PORT
  protocol          = "tcp"
  source_security_group_id = aws_security_group.api-elb-securitygroup.id
  security_group_id = aws_security_group.api-instance-securitygroup.id
}

resource "aws_security_group_rule" "api-instance-securitygroup-rule-3" {
  type              = "ingress"
  from_port = 0
  to_port = 0
  protocol = "-1"
  cidr_blocks = ["10.0.0.0/16"]
  security_group_id = aws_security_group.api-instance-securitygroup.id
}

resource "aws_security_group" "api-instance-securitygroup" {
  vpc_id = aws_vpc.main.id
  name = "api-instance"
  description = "security group that allows all egress traffic"
 
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "api-instance"
  }
}
