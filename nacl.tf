resource "aws_network_acl" "lb" {
  vpc_id     = aws_vpc.terra_vpc.id
  subnet_ids = aws_subnet.lb.*.id
  tags = {
    Name = "loadbalancer-public-nacl"
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

}

resource "aws_network_acl" "db" {
  vpc_id     = aws_vpc.terra_vpc.id
  subnet_ids = aws_subnet.db.*.id
  tags = {
    Name = "database-private-nacl"
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "172.17.0.0/16"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "172.17.0.0/16"
    from_port  = 0
    to_port    = 0
  }

  egress {
    protocol   = "tcp"
    rule_no    = 101
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 65535
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 101
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 32768
    to_port    = 65535
  }
}

resource "aws_network_acl" "app" {
  vpc_id     = aws_vpc.terra_vpc.id
  subnet_ids = aws_subnet.app.*.id
  tags = {
    Name = "wakau-app-public-nacl"
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "172.17.0.0/16"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "172.17.0.0/16"
    from_port  = 0
    to_port    = 0
  }

}

resource "aws_network_acl" "jump" {
  vpc_id     = aws_vpc.terra_vpc.id
  subnet_ids = aws_subnet.jump.*.id
  tags = {
    Name = "jump-default-nacl"
  }

  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "172.17.0.0/16"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "172.17.0.0/16"
    from_port  = 0
    to_port    = 0
  }
  egress {
    protocol   = -1
    rule_no    = 101
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = -1
    rule_no    = 101
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

}

