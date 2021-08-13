# Subnets : LoadBalancer
resource "aws_subnet" "lb" {
  count                   = length(var.lb_subnets_cidr)
  vpc_id                  = aws_vpc.terra_vpc.id
  cidr_block              = element(var.lb_subnets_cidr, count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "wakau-lb-subnet-${count.index + 1}"
  }
}

# Subnets : App 
resource "aws_subnet" "app" {
  count                   = length(var.app_subnets_cidr)
  vpc_id                  = aws_vpc.terra_vpc.id
  cidr_block              = element(var.app_subnets_cidr, count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = true
  tags = {
    Name = "wakau-app-subnet-${count.index + 1}"
  }
}


# Subnets : Databases
resource "aws_subnet" "db" {
  count                   = length(var.db_subnets_cidr)
  vpc_id                  = aws_vpc.terra_vpc.id
  cidr_block              = element(var.db_subnets_cidr, count.index)
  availability_zone       = element(var.azs, count.index)
  map_public_ip_on_launch = false
  tags = {
    Name = "wakau-db-subnet-${count.index + 1}"
  }
}

# Subnets : Jump
resource "aws_subnet" "jump" {
  vpc_id                  = aws_vpc.terra_vpc.id
  cidr_block              = var.jump
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = true
  tags = {
    Name = "wakau-jump-subnet"
  }
}

