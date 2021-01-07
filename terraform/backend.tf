terraform {
  backend "s3" {
    bucket = "bucket name"
    key    = "path"
    region = "us-east-1"
  }
}
