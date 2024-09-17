resource "aws_security_group" "demo_lambda_sg" {
  vpc_id = aws_vpc.demo_private_vpc.id 
}