resource "aws_vpc" "demo_private_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "demo_private_vpc"
  }
}