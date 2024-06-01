provider "aws" {
  region = var.aws_region
}

data "aws_ami" "latest_ubuntu" {
  most_recent = true
  owners      = [var.ami_owner]

  filter {
    name   = "name"
    values = ["${var.ami_filter[0].values[0]}"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "example_instance" {
  ami           = data.aws_ami.latest_ubuntu.id
  instance_type = var.instance_type

  tags = {
    Name        = "${var.environment}-instance"
    Environment = var.environment
  }
}