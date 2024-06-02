terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.66.1"

    }
  }
}
#Authentication Information 
provider "aws" {

  region = "ap-south-1"

}
provider "aws" {
  alias = "us-west-1"

  region = "us-west-1"
}
