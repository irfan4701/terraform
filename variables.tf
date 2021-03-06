variable "aws_region" {
  default = "us-east-1"
}

variable "vpc_cidr" {
  default = "172.17.0.0/16"
}

variable "lb_subnets_cidr" {
  type    = list
  default = ["172.17.1.0/24", "172.17.2.0/24", "172.17.3.0/24"]
}

variable "app_subnets_cidr" {
  type    = list
  default = ["172.17.10.0/24", "172.17.11.0/24", "172.17.12.0/24"]
}

variable "db_subnets_cidr" {
  type    = list
  default = ["172.17.4.0/24", "172.17.5.0/24", "172.17.6.0/24"]
}

variable "jump" {
  default = "172.17.7.0/28"
}

variable "azs" {
  type    = list
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

variable "ami" {
  default = "ami-0015b9ef68c77328d"
}

variable "public_key_path" {
  default = "/home/irfan/Projects/Terraform/wakau/terraform.pub"
}

variable "key_name" {
  default = "terraform.pem"
}

variable "jump_instance_type" {
  default = "t2.small"
}

variable "jump_instance_name" {
  default = "jump-server"
}

variable "jump_ip" {
  default = "172.17.7.10"
}

variable "app_instance_type" {
  default = "t2.small"
}

variable "app_instance_name" {
  type    = list
  default = ["wakau-app-01"]
}

variable "app_ip" {
  type    = list
  default = ["172.17.10.10"]
}

variable "db_ip" {
  type    = list
  default = ["172.17.4.10", "172.17.5.10"]
}

variable "db_instance_type" {
  default = "t2.small"
}

variable "db_instance_name" {
  type    = list
  default = ["mongodb-1", "mongodb-2", "mongodb-3"]
}

variable "redis_ip" {
  type    = list
  default = ["172.17.4.20", "172.17.5.20"]
}

variable "redis_instance_type" {
  default = "t2.small"
}

variable "redis_instance_name" {
  type    = list
  default = ["redis-1", "redis-2"]
}

