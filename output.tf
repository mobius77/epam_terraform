output "instance_ip" {
  value = aws_instance.my_project_instance.public_ip
}