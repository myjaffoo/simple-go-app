variable "region" {
  description = "AWS region"
}

variable "environment" {
  description = "The name of the environment"
}

variable "associate_public_ip_address" {
  description = "Associate a public ip address with an instance in a VPC"
}

variable "ebs_optimized" {
  description = "If true, the launched EC2 instance will be EBS-optimized"
}

variable "instance_type" {
  description = "The size of instance to launch"
}

variable "key_name" {
  description = "The key name that should be used for the instance"
}

variable "root_volume_size" {
  description = "The size of the volume in gigabytes"
}

variable "force_delete" {
  description = "Allows deleting the autoscaling group without waiting for all instances in the pool to terminate. "
}

variable "desired_capacity" {
  description = "The number of Amazon EC2 instances that should be running in the group"
}

variable "max_size" {
  description = "The maximum size of the auto scale group"
}

variable "min_size" {
  description = "The minimum size of the auto scale group"
}

variable "health_check_type" {
  description = "EC2 or ELB. Controls how health checking is done"
}

variable "health_check_healthy_threshold" {
  description = "The number of checks before the instance is declared healthy"
}

variable "health_check_unhealthy_threshold" {
  description = " The number of checks before the instance is declared unhealthy"
}

variable "health_check_timeout" {
  description = "The length of time before the check times out"
}

variable "health_check_target" {
  description = " The target of the check. Valid pattern is $PROTOCOL:$PORT$PATH"
}

variable "health_check_interval" {
  description = "The interval between checks"
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

variable "version" {
  description = "latest stable version of the go binary"
}

variable "os" {
  description = "linux, darwin, windows"
}

variable "arch" {
  description = "amd64, 386, arm, s390x, ppc64le"
}