output "instance_id" {
  value       = aws_instance.new_instance.id
  description = "The ID of ec2 instance"
}
