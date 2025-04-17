terraform {
  backend "s3" {
    bucket = "githubsample-64537323"
    key    = "tf-backend"
    region = "ap-south-1"
  }
}