variable "WEB_PORT" {
  default =  "80"
}

variable "API_PORT" {
  default =  "8000"
}

variable "AWS_REGION" {
  default = "us-east-1"
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "/home/manuel/Documents/Keys/n26/key1"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "/home/manuel/Documents/Keys/n26/key1.pub"
}

variable "API_INSTANCE_AMI"{
  default = "ami-07d8ba21b6e6141cf"
  }

variable "WEB_INSTANCE_AMI"{
  default = "ami-0894e8b4637b50afe"
  }

variable "AMIS" {
  type = map
  default = {
    us-east-1 = "ami-028734ac51ff6ab87"
  }
}

variable "INSTANCE_USERNAME" {
  default = "ec2-user"
}

variable "INSTANCE_DEVICE_NAME" {
  default = "/dev/xvdh"
}

variable "JENKINS_VERSION" {
  default = "2.164"
}

variable "TERRAFORM_VERSION" {
  default = "0.14.3"
}

variable "APP_INSTANCE_COUNT" {
  default = "1"
}
