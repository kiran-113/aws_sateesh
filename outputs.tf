output "aws_region" {
  description = "AWS region"
  value       = data.aws_region.current.name
}

# Output the public IPs of each instance

output "ec2_public_ips" {
  value = [
    for idx, instance in data.aws_instances.example.ids :
    {
      ec2_name    = aws_instance.this[idx].tags["Name"]
      public_ip   = aws_instance.this[idx].public_ip
      Instance_Id = aws_instance.this[idx].id
    }
  ]
  depends_on = [ data.aws_instances.example ]
}
