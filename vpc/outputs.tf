output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "vpc_main_rt_id" {
  value = "${aws_vpc.main.main_route_table_id}"
}

output "public_subnet_cidr_blocks" {
  value = ["${aws_subnet.public_subnet.*.cidr_block}"]
}

output "public_subnet_ids" {
  value = ["${aws_subnet.public_subnet.*.id}"]
}
