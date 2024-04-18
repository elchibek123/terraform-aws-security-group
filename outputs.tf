output "security_group_id" {
  description = "This is id of the security group"
  value       = aws_security_group.sg.id
}