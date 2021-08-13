#route table: LB
resource "aws_route_table" "lb_rt" {
  vpc_id = aws_vpc.terra_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.wp_internet_gateway.id
  }
  tags = {
    Name = "loadbalancer-public-rt"
  }
}

# Route table association with LB Subnets
resource "aws_route_table_association" "a" {
  count          = length(var.lb_subnets_cidr)
  subnet_id      = element(aws_subnet.lb.*.id, count.index)
  route_table_id = aws_route_table.lb_rt.id
}

#route table: Jump
resource "aws_route_table" "jump_rt" {
  vpc_id = aws_vpc.terra_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.wp_internet_gateway.id
  }
  tags = {
    Name = "jump-default-rt"
  }
}


# Route table association with Jump Subnet
resource "aws_route_table_association" "jump" {
  #count = length(var.lb_subnets_cidr)
  subnet_id      = aws_subnet.jump.id
  route_table_id = aws_route_table.jump_rt.id
}


#route table: App
resource "aws_route_table" "app_rt" {
  vpc_id = aws_vpc.terra_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.wp_internet_gateway.id
  }
  tags = {
    Name = "wakau-public-rt"
  }
}

# Route table association with App Subnets
resource "aws_route_table_association" "b" {
  count          = length(var.app_subnets_cidr)
  subnet_id      = element(aws_subnet.app.*.id, count.index)
  route_table_id = aws_route_table.app_rt.id
}


#route table: DB
resource "aws_route_table" "db_rt" {
  vpc_id = aws_vpc.terra_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.ng.id
  }
  tags = {
    Name = "database-private-rt"
  }
}

# Route table association with DB Subnets
resource "aws_route_table_association" "c" {
  count          = length(var.db_subnets_cidr)
  subnet_id      = element(aws_subnet.db.*.id, count.index)
  route_table_id = aws_route_table.db_rt.id
}

