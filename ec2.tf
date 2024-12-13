resource "aws_instance" "public_ec2" {
  ami                     = "ami-0e2c8caa4b6378d8c"
  instance_type           = "m2.micro"
  
}