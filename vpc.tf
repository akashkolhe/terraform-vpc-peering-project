# VPC 1
resource "aws_vpc" "vpc1" {
  cidr_block = var.vpc1_cidr

  tags = {
    Name = "VPC-1"
  }
}

# VPC 2
resource "aws_vpc" "vpc2" {
  cidr_block = var.vpc2_cidr

  tags = {
    Name = "VPC-2"
  }
}

# Subnet 1
resource "aws_subnet" "subnet1" {
  vpc_id                  = aws_vpc.vpc1.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Subnet-1"
  }
}

# Subnet 2
resource "aws_subnet" "subnet2" {
  vpc_id                  = aws_vpc.vpc2.id
  cidr_block              = "192.168.1.0/24"
  availability_zone       = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Subnet-2"
  }
}

# Internet Gateway for VPC 1
resource "aws_internet_gateway" "igw1" {
  vpc_id = aws_vpc.vpc1.id

  tags = {
    Name = "IGW-VPC1"
  }
}

# Internet Gateway for VPC 2
resource "aws_internet_gateway" "igw2" {
  vpc_id = aws_vpc.vpc2.id

  tags = {
    Name = "IGW-VPC2"
  }
}

