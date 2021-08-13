resource "aws_efs_file_system" "terra_efs" {
  creation_token = "my-product"

  tags = {
    Name = "TerraEFS"
  }

  lifecycle_policy {
    transition_to_ia = "AFTER_30_DAYS"
  }

  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"
}


resource "aws_efs_mount_target" "efs_mount" {
  count           = length(var.db_ip)
  file_system_id  = aws_efs_file_system.terra_efs.id
  subnet_id       = aws_subnet.app.*.id[count.index]
  security_groups = [aws_security_group.app_security_group.id]
}
