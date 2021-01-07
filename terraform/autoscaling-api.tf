resource "aws_launch_template" "api-launchtemplate" {
  name                   = "api-launchtemplate-"
  image_id               = var.API_INSTANCE_AMI
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.api-instance-securitygroup.id]

  key_name = "Key1"

#  user_data = "${base64encode(data.template_file.api-shell-script.rendered)}"
#
#  iam_instance_profile {
#    name = aws_iam_instance_profile.CloudWatchAgentServerRole-instanceprofile.name
#  }

}

resource "aws_autoscaling_group" "api-autoscaling" {
  depends_on = [
  aws_route53_record.app
  ]

  name = "${aws_launch_template.api-launchtemplate.name}-asg"

  vpc_zone_identifier  = [aws_subnet.main-private-1.id]
  min_size             = 1
  max_size             = 1
  health_check_grace_period = 300
  health_check_type = "ELB"
  target_group_arns = [aws_alb_target_group.api-target-group.arn]
  force_delete = true

    launch_template {
    id      = aws_launch_template.api-launchtemplate.id
    version = "$Latest"
    }

    lifecycle {
      create_before_destroy = true
  }

    tag {
      key = "Name"
      value = "api-ec2-instance"
      propagate_at_launch = true
  }

}
