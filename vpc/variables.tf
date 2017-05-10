variable "region" {
  description = "AWS region"
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
}

variable "public_subnet_1a_cidr" {
  description = "The CIDR block for the public subnet in eu-west-1a"
}

variable "public_subnet_1b_cidr" {
  description = "The CIDR block for the public subnet in eu-west-1b"
}

variable "public_subnet_1c_cidr" {
  description = "The CIDR block for the public subnet in eu-west-1c"
}
