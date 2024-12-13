resource "aws_subnet" "public-subnet" {
  vpc_id     = aws_vpc.tf-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "tf-public-subnet"
  }
}
resource "aws_subnet" "private-subnet" {
  vpc_id     = aws_vpc.tf-vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "tf-private-subnet"
  }
}
