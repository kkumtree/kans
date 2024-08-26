resource "aws_vpc" "kans_vpc" {
  cidr_block           = var.vpc_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "Kans-VPC"
  }
}

resource "aws_subnet" "public_subnet1" {
  availability_zone       = var.availability_zone1
  cidr_block              = var.public_subnet1_block
  vpc_id                  = aws_vpc.kans_vpc.id
  map_public_ip_on_launch = true
  tags = {
    Name = "Kans-PublicSubnet1"
  }
}

resource "aws_subnet" "public_subnet2" {
  availability_zone       = var.availability_zone2
  cidr_block              = var.public_subnet2_block
  vpc_id                  = aws_vpc.kans_vpc.id
  map_public_ip_on_launch = true
  tags = {
    Name = "Kans-PublicSubnet2"
  }
}

resource "aws_internet_gateway" "internet_gateway" {}

resource "aws_route_table" "public_subnet_route_table" {
  vpc_id = aws_vpc.kans_vpc.id
  tags = {
    Name = "Kans-PublicSubnetRouteTable"
  }
}

resource "aws_route" "public_subnet_route" {
  route_table_id         = aws_route_table.public_subnet_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.internet_gateway.id
}

resource "aws_route_table_association" "public_subnet1_route_table_association" {
  subnet_id      = aws_subnet.public_subnet1.id
  route_table_id = aws_route_table.public_subnet_route_table.id
}

resource "aws_route_table_association" "public_subnet2_route_table_association" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.public_subnet_route_table.id
}