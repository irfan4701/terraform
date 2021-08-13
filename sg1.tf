resource "aws_security_group" "jump_security_group" {
  name   = "Jump Security"
  vpc_id = aws_vpc.terra_vpc.id
  tags = {
    Name = "Wakau Jump SG"
  }
}

resource "aws_security_group_rule" "jump_ingress_rules" {
  for_each          = var.jump_ingress_rules
  type              = "ingress"
  from_port         = each.value.from
  to_port           = each.value.to
  protocol          = each.value.proto
  cidr_blocks       = [each.value.cidr]
  description       = each.value.desc
  security_group_id = aws_security_group.jump_security_group.id
}

resource "aws_security_group_rule" "jump_egress_rules" {
  for_each          = var.jump_egress_rules
  type              = "egress"
  from_port         = each.value.from
  to_port           = each.value.to
  protocol          = each.value.proto
  cidr_blocks       = [each.value.cidr]
  description       = each.value.desc
  security_group_id = aws_security_group.jump_security_group.id
}

resource "aws_security_group" "app_security_group" {
  name   = "App SG"
  vpc_id = aws_vpc.terra_vpc.id
  tags = {
    Name = "Wakau App SG"
  }
}

resource "aws_security_group_rule" "app_ingress_rules" {
  for_each          = var.jump_ingress_rules
  type              = "ingress"
  from_port         = each.value.from
  to_port           = each.value.to
  protocol          = each.value.proto
  cidr_blocks       = [each.value.cidr]
  description       = each.value.desc
  security_group_id = aws_security_group.app_security_group.id
}

resource "aws_security_group_rule" "app_egress_rules" {
  for_each          = var.jump_egress_rules
  type              = "egress"
  from_port         = each.value.from
  to_port           = each.value.to
  protocol          = each.value.proto
  cidr_blocks       = [each.value.cidr]
  description       = each.value.desc
  security_group_id = aws_security_group.app_security_group.id
}


