terraform {
  backend "s3" {
    bucket = "mannyurbano-bucket"
    key    = "terraform/3-tier-webapp-state/"
    region = "us-east-1"
  }
}
