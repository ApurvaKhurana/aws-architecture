# vpc_id
output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

# default public route table id
output "private_route_table_id" {
  value = aws_vpc.my_vpc.main_route_table_id
}

# public subnet id
output "public_subnet_id" {
  value = aws_subnet.my_public_subnet.id
}

# private subnet id
output "private_subnet_id" {
  value = aws_subnet.my_private_subnet.id
}

# internet gateway id
output "igw_id" {
  value = aws_internet_gateway.my_igw.id
}

# private route table id
output "public_route_table_id" {
  value = aws_route_table.my_public_route_table.id
}

#public ec2 instance id
output "public_ec2_instance_id" {
  value = aws_instance.my_private_ec2.id
}

#private ec2 instance id
output "private_ec2_instance_id" {
  value = aws_instance.my_private_ec2.id
}