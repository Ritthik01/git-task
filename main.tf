terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "example" {
  ami           = "ami-01a00762f46d584a1"
  instance_type = "t3.micro"
  key_name = "fazoK"
  
  user_data = file("${path.module}/userdata.sh")

  tags = {
    Name = "ritthik-instance"
  }
}

output "public_ip" {
  value = aws_instance.example.public_ip
}
