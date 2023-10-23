resource "aws_cloud9_environment_ec2" "example" {
  name            = "Cloud9-Ubuntu22.04"
  instance_type   = "t3.medium"
  connection_type = "CONNECT_SSM"
  image_id        = "resolve:ssm:/aws/service/cloud9/amis/ubuntu-22.04-x86_64"
  subnet_id       = "subnet-03aab735be5933db3"
}

data "aws_instance" "cloud9_instance" {
  filter {
    name = "tag:aws:cloud9:environment"
    values = [
    aws_cloud9_environment_ec2.example.id]
  }
}

/*
resource "aws_eip" "cloud9_eip" {
  instance = data.aws_instance.cloud9_instance.id
  domain   = "vpc"
}

output "cloud9_public_ip" {
  value = aws_eip.cloud9_eip.public_ip
}*/
