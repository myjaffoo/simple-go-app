output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "vpc_main_rt_id" {
  value = "${aws_vpc.main.main_route_table_id}"
}

output "public_subnet_1a" {
  value = "${aws_subnet.public_subnet_1a.id}"
}

output "public_subnet_1b" {
  value = "${aws_subnet.public_subnet_1b.id}"
}

output "public_subnet_1c" {
  value = "${aws_subnet.public_subnet_1c.id}"
}