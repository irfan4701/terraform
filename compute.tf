#key pair

resource "aws_key_pair" "wakau_key" {
  key_name   = var.key_name
  public_key = file(var.public_key_path)
}


#AWS instances
resource "aws_instance" "jump_server" {
  instance_type = var.jump_instance_type
  ami           = var.ami

  tags = {
    Name = var.jump_instance_name
  }

  key_name               = aws_key_pair.wakau_key.id
  vpc_security_group_ids = [aws_security_group.jump_security_group.id]
  subnet_id              = aws_subnet.jump.id
  private_ip             = var.jump_ip
  user_data              = file("createUserAll.sh")

}


#AWS instances
resource "aws_instance" "app_servers" {
  count         = length(var.app_ip)
  instance_type = var.app_instance_type
  ami           = var.ami

  tags = {
    Name = element(var.app_instance_name, count.index)
  }

  key_name               = aws_key_pair.wakau_key.id
  vpc_security_group_ids = [aws_security_group.app_security_group.id]
  subnet_id              = aws_subnet.app.*.id[count.index]
  private_ip             = element(var.app_ip, count.index)
  user_data              = file("createUserAll.sh")

}

resource "aws_instance" "db_servers" {
  count         = length(var.db_ip)
  instance_type = var.db_instance_type
  ami           = var.ami

  tags = {
    Name = element(var.db_instance_name, count.index)
  }

  key_name               = aws_key_pair.wakau_key.id
  vpc_security_group_ids = [aws_security_group.jump_security_group.id]
  subnet_id              = aws_subnet.db.*.id[count.index]
  private_ip             = element(var.db_ip, count.index)

}

resource "aws_instance" "redis_servers" {
  count         = length(var.redis_ip)
  instance_type = var.redis_instance_type
  ami           = var.ami

  tags = {
    Name = element(var.redis_instance_name, count.index)
  }

  key_name               = aws_key_pair.wakau_key.id
  vpc_security_group_ids = [aws_security_group.jump_security_group.id]
  subnet_id              = aws_subnet.db.*.id[count.index]
  private_ip             = element(var.redis_ip, count.index)

}

