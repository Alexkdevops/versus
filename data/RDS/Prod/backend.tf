terraform {
  backend "s3" {
    bucket = "21c-centos"
    key    = "rds-db-versus.tfstate"
    region = "us-east-2"
  }
}
