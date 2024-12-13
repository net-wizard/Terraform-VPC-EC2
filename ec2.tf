resource "aws_instance" "public_ec2" {
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public-subnet.id
  key_name      = aws_key_pair.ec2-key.key_name
  tags = {
    Name = "public_ec2"
  }
}
resource "aws_instance" "private_ec2" {
    depends_on = [ aws_subnet.private-subnet ]
  ami           = "ami-0e2c8caa4b6378d8c"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private-subnet.id
  key_name      = aws_key_pair.ec2-key.key_name
   tags = {
    Name = "pvt_ec2"
  }
}


resource "aws_key_pair" "ec2-key" {
  key_name   = "demo-key"
  public_key = tls_private_key.demo-private.public_key_openssh
}

resource "local_file" "key-gen" {
  content         = tls_private_key.demo-private.private_key_pem
  filename        = "demo-key.pem"
  file_permission = "0400"
}

resource "tls_private_key" "demo-private" {
  algorithm = "RSA"
  rsa_bits  = 4096
}