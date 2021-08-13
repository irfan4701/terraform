# VPC
resource "aws_vpc" "terra_vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  enable_dns_support   = true
  tags = {
    Name = "TerraVPC"
  }
}

#IGW
resource "aws_internet_gateway" "wp_internet_gateway" {
  vpc_id = aws_vpc.terra_vpc.id
  tags = {
    Name = "wp_igw"
  }
}

#EIP
resource "aws_eip" "nat" {
  #count = 3
  vpc = true
}


#NAT Gateway
resource "aws_nat_gateway" "ng" {
  #count = 3
  #vpc_id = aws_vpc.terra_vpc.id
  allocation_id = aws_eip.nat.id
  #subnet_id     = aws_subnet.lb.*.id[count.index]
  subnet_id     = aws_subnet.lb[0].id
  tags = {
    Name = "NAT Gateway"
  }
}
