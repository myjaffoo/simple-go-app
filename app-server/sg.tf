resource "aws_security_group" "app_security_group" {
  lifecycle {
    create_before_destroy = true
  }

  name        = "sgrp-${var.environment}"
  description = "Go application security group"
  vpc_id      = "${module.vpc.vpc_id}"

  tags = {
    Name = "sg-${var.environment}"
  }
}

resource "aws_security_group_rule" "sgr_egress_all" {
  type              = "egress"
  protocol          = -1
  from_port         = 0
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.app_security_group.id}"
}

resource "aws_security_group_rule" "sgr_ingress_8484" {
  type                     = "egress"
  protocol                 = "tcp"
  from_port                = 8484
  to_port                  = 8484
  source_security_group_id = "${aws_security_group.elb_security_group.id}"
  security_group_id        = "${aws_security_group.app_security_group.id}"
}

resource "aws_security_group" "elb_security_group" {
  lifecycle {
    create_before_destroy = true
  }

  name        = "sgelb-${var.environment}"
  description = "Go application ELB security group"
  vpc_id      = "${module.vpc.vpc_id}"

  tags = {
    Name = "sgelb-${var.environment}"
  }
}

resource "aws_security_group_rule" "sgr_elb_egress_all" {
  type              = "egress"
  protocol          = -1
  from_port         = 0
  to_port           = 0
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.elb_security_group.id}"
}

resource "aws_security_group_rule" "sgr_elb_ingress_8080" {
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 8080
  to_port           = 8080
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = "${aws_security_group.app_security_group.id}"
}
