provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "my_project_instance" {
#  ami           = "ami-03e08697c325f02ab"
  ami           = "ami-0b4c74d41ee4bed78"
  instance_type = "t2.micro"
  key_name = "mytask"
  vpc_security_group_ids = [aws_security_group.allow_access.id]

  tags = {
    "Name" = "my_project_ec2"
  }

  # create and attach an EBS volume
  root_block_device {
    volume_size = "10"
  }
}

# resource "aws_eip" "my_project_instance" {
#   vpc = true
#   instance = aws_instance.my_project_instance.id
# }

resource "aws_security_group" "allow_access" {
  name        = "allow_access"
  description = "Allow access to ports 22, 18000-18003"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

 ingress {
    from_port   = 18000
    to_port     = 18003
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }  
}

output "instance_ip" {
  value = aws_instance.my_project_instance.public_ip
}