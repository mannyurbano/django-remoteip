### WEB EC2 ###

#resource "aws_instance" "web-instance" {
#  ami           = var.WEB_INSTANCE_AMI
#  instance_type = "t2.micro"
#
#  subnet_id = aws_subnet.main-public-1.id
#  private_ip = "10.0.1.10"
#
#  vpc_security_group_ids = [aws_security_group.web-instance-securitygroup.id, aws_security_group.web-elb-securitygroup.id]
#
#  tags = {
#    Name = "web-instance-1"
#    Project = "JobApplication2021"
#  }
#}
#
#resource "aws_alb_target_group_attachment" "web-target-group" {
#  target_group_arn = aws_alb_target_group.web-target-group.arn
#  target_id        = aws_instance.web-instance.id
#  port             = 80
#}


### API EC2 ###

#resource "aws_instance" "api-instance" {
#  ami           = var.API_INSTANCE_AMI
#  instance_type = "t2.micro"
#
#  subnet_id = aws_subnet.main-private-1.id
#  private_ip = "10.0.21.10"
#
#  vpc_security_group_ids = [aws_security_group.api-instance-securitygroup.id, aws_security_group.api-elb-securitygroup.id]
#
#  tags = {
#    Name = "api-instance-1"
#    Project = "JobApplication2021"
#  }
#}
