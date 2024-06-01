variable "aws_region" {
  description = "The AWS region to create resources in"
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "environment" {
  description = "The environment name"
  type        = string
}

variable "ami_owner" {
  description = "The owner ID of the AMI"
  type        = string
}

variable "ami_filter" {
  description = "Filter criteria for AMI"
  type        = list(object({ name = string, values = list(string) }))
}