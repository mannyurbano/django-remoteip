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
  default = "/"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "/"
}

variable "API_INSTANCE_AMI"{
  default = "ami-id"
  }

variable "WEB_INSTANCE_AMI"{
  default = "ami-id"
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
