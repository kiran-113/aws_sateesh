data "aws_instances" "example" {
  instance_tags = {
    Name = "*"
  }
  depends_on = [ aws_instance.this ]
}