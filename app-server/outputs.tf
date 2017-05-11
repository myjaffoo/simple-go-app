output "service_sg_id" {
  value = "${aws_security_group.app_security_group.id}"
}

output "elb_sg_id" {
  value = "${aws_security_group.elb_security_group.id}"
}
