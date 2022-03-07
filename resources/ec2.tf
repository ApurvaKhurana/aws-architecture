#ec2 in public subnet
resource "aws_instance" "my_public_ec2" {
  ami           = data.aws_ami.ami.id
  instance_type = var.instance_type
  # key_name      = var.key_name

  subnet_id = aws_subnet.my_public_subnet.id

  tags = {
    Name = "my-public-ec2"
  }
}

#ec2 in private subnet
resource "aws_instance" "my_private_ec2" {
  ami           = data.aws_ami.ami.id
  instance_type = var.instance_type
  # key_name      = var.key_name

  subnet_id = aws_subnet.my_private_subnet.id

  tags = {
    Name = "my-private-ec2"
  }

}

