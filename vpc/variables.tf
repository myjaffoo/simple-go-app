variable "region" {
  description = "AWS region"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
}

variable "public_subnet_cidr" {
  type = "list"
  description = "List of CIDR blocks for all the public subnet in eu-west-1a, b and c"
}