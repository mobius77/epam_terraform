provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "my_project_instance" {
  ami           = "ami-0b4c74d41ee4bed78"
  instance_type = "t2.micro"
  key_name = "mytask"
  vpc_security_group_ids = [aws_security_group.allow_access.id]

  tags = {
    "Name" = "my_project_ec2"
  }

  # create and attach an EBS volume
  root_block_device {
    volume_size = "8"
  }
}


resource "aws_instance" "my_project_instance_prod" {
  ami           = "ami-0b4c74d41ee4bed78"
  instance_type = "t2.micro"
  key_name = "mytask"
  vpc_security_group_ids = [aws_security_group.allow_access.id]

  tags = {
    "Name" = "my_project_ec2_prod"
  }

  # create and attach an EBS volume
  root_block_device {
    volume_size = "8"
  }
}


# resource "aws_eip" "my_project_instance" {
#   vpc = true
#   instance = aws_instance.my_project_instance.id
# }