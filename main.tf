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

  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World!" 
              sudo apt update 
              sudo apt install nginx -y 
              sudo systemctl start nginx
              sudo systemctl enable nginx
              sudo echo ./index.html > /var/www/html/index.html
              EOF
  tags = {
    Name = "ritthik-instance"
  }
}

