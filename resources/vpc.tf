#create aws vpc
resource "aws_vpc" "my_vpc" {

  cidr_block       = var.vpc_cidr
  instance_tenancy = var.vpc_tenancy

  tags = {
    Name = "my-vpc"
  }
}

#create public subnet
resource "aws_subnet" "my_public_subnet" {

  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.public_subnet_cidr
  availability_zone = var.availability_zone

  # enable public ip addresses in public subne
  map_public_ip_on_launch = true

  tags = {
    Name = "my-public-subnet"
  }
}

#create private subnet
resource "aws_subnet" "my_private_subnet" {

  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = var.availability_zone

  tags = {
    Name = "my-private-subnet"
  }
}

#create an internet gateway for public subnet
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my-igw"
  }
}

#create a route table for public subnet
resource "aws_route_table" "my_public_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  #add a route to igw for internet accessibility
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "my-public-route-table"
  }
}

#fetch details of private route table created by default with vpc for private subnet
resource "aws_default_route_table" "my_private_route_table" {
  default_route_table_id = aws_vpc.my_vpc.default_route_table_id

  tags = {
    Name = "my-private-route-table"
  }
}

#assosiate public route table with public subnet
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.my_public_subnet.id
  route_table_id = aws_route_table.my_public_route_table.id
}

#assosiate private route table with private subnet
resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.my_private_subnet.id
  route_table_id = aws_vpc.my_vpc.main_route_table_id
}