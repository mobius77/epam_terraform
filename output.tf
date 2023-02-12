output "test_instance_ip" {
  value = aws_instance.my_project_instance.public_ip
}

output "prod_instance_ip" {
  value = aws_instance.my_project_instance_prod.public_ip
}