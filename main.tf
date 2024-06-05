# data "aws_region" "current" {}

# # Read local index.html file
# locals {
#   index_html = filebase64("index.html")
# }

# # Create the instances using a count variable

# resource "aws_instance" "this" {
#   #provider      = aws.ap-east-1
#   count           = length(var.instance_names)
#   ami             = "ami-0851b76e8b1bce90b"
#   instance_type   = "t2.micro"
#   key_name        = aws_key_pair.this.key_name
#   security_groups = [aws_security_group.allow_tls_rules[count.index].name]

#   tags = {

#     Name = var.instance_names[count.index]

#   }
#   user_data = <<-EOF
#     #! /bin/bash
#     sudo apt-get update
#     sudo apt-get install -y apache2
#     sudo systemctl start apache2
#     sudo systemctl enable apache2
#     echo "${local.index_html}" | base64 -d | sudo tee /var/www/html/index.html
#   EOF


#   connection {
#     type        = "ssh"
#     user        = "ubuntu"
#     private_key = tls_private_key.oskey.private_key_pem
#     host        = aws_instance.this[0].public_ip
#   }

# }
# # Genaraetes Random number

# resource "random_string" "random_number" {
#   length  = 6 # Specify the desired length of the hexadecimal string
#   special = false
# }

# # key_par

# resource "tls_private_key" "oskey" {
#   algorithm = "RSA"
# }

# # creates pem file locally 

# resource "local_file" "myterrakey" {
#   content  = tls_private_key.oskey.private_key_pem
#   filename = "my-ec2key.pem"
# }

# resource "aws_key_pair" "this" {
#   key_name   = "my-ec2key-${random_string.random_number.result}"
#   public_key = tls_private_key.oskey.public_key_openssh
# }

# ###### vpc #########

# resource "aws_vpc" "my_vpc" {
#   cidr_block = "172.16.0.0/16"

#   tags = {
#     Name = "tf-vpc"
#   }
# }

# resource "aws_subnet" "my_subnet" {
#   vpc_id            = aws_vpc.my_vpc.id
#   cidr_block        = "172.16.10.0/24"
#   availability_zone = "ap-south-1a"

#   tags = {
#     Name = "tf-subnet"
#   }
# }

# resource "aws_network_interface" "foo" {
#   subnet_id   = aws_subnet.my_subnet.id
#   private_ips = ["172.16.10.100"]

#   tags = {
#     Name = "primary_network_interface"
#   }
# }



# resource "aws_security_group" "allow_tls_rules" {
#   count       = length(var.instance_names)
#   name        = var.instance_names[count.index]
#   description = "Allow TLS inbound traffic"

#   ingress {
#     description = "SSH from VPC"
#     from_port   = 22
#     to_port     = 22
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   ingress {
#     description = "HTTPS from VPC"
#     from_port   = 443
#     to_port     = 443
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]

#   }
#   ingress {
#     description = "HTTP from VPC"
#     from_port   = 80
#     to_port     = 80
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"]

#   }

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }

#   tags = {
#     Name = var.instance_names[count.index]

#   }
# }
