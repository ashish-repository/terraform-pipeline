output "public_ip" {
  value       = aws_instance.myec2.public_ip
  description = "Public IP of EC2 instance"
}

output "instance_id" {
  value       = aws_instance.myec2.id
  description = "EC2 Instance ID"
}
