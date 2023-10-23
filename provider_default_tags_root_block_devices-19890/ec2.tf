provider "aws" {
  region = "us-west-2"

  default_tags {
    tags = {
      Name = "boars"
      Foo = "bar"
    }
  }
}

data "aws_ami" "debian_buster" {
  most_recent = true
  owners      = ["136693071363"]

  filter {
    name   = "name"
    values = ["debian-10-amd64-*"]
  }
}

resource "aws_instance" "example2" {
  ami           = data.aws_ami.debian_buster.id
  instance_type = "t3.micro"

  tags = {
    test = "ing"
  }

  root_block_device {
    tags = {
    } 
  }
}
