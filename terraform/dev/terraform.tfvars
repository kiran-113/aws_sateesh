aws_region   = "ap-south-1"
instance_type = "t2.micro"
ami_owner    = "099720109477"  # Example owner ID for Canonical (Ubuntu)
ami_filter = [
  {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
]