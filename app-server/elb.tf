resource "aws_elb" "app_elb" {
  name            = "elb-${var.environment}"
  security_groups = ["${aws_security_group.elb_security_group.id}"]

  subnets = [
    "${module.vpc.public_subnet_1a}",
    "${module.vpc.public_subnet_1b}",
    "${module.vpc.public_subnet_1c}",
  ]

  listener {
    instance_port     = 8484
    instance_protocol = "http"
    lb_port           = "8080"
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = "${var.health_check_healthy_threshold}"
    unhealthy_threshold = "${var.health_check_unhealthy_threshold}"
    timeout             = "${var.health_check_timeout}"
    target              = "${var.health_check_target}"
    interval            = "${var.health_check_interval}"
  }

  tags {
    Name = "elb-${var.environment}"
  }
}
