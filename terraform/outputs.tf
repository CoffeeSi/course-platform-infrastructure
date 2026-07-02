output "instance_public_ip" {
  description = "Public IP address of the instance"
  value       = aws_instance.course_platform_instance.public_ip
}

output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.course_platform_instance.id
}

output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.main_sg.id
}
