provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "example" {
  ami           = "ami-03e08697c325f02ab"
  instance_type = "t2.micro"

  key_name = "mytask"

  vpc_security_group_ids = [aws_security_group.ssh.id]

  # create and attach an EBS volume
  root_block_device {
    volume_size = "10"
  }
}

# resource "aws_eip" "example" {
#   vpc = true
#   instance = aws_instance.example.id
# }

resource "aws_security_group" "ssh" {
  name        = "allow_ssh"
  description = "Allow SSH access from anywhere"

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