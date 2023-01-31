provider "aws" {
  region = "eu-central-1"
}

resource "aws_instance" "example" {
  ami           = "ami-03e08697c325f02ab"
  instance_type = "t2.micro"

  # create and attach an EBS volume
  root_block_device {
    volume_size = "10"
  }
}

# resource "aws_eip" "example" {
#   vpc = true
#   instance = aws_instance.example.id
# }