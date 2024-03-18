terraform {
  backend "s3" {
    bucket = "soat3"
    key    = "soat3-cluster"
    region = "us-east-1"
  }
}
