data "aws_ami" "rhel7_ami" {
  most_recent = true

  filter {
    name = "name"

    values = [
      "RHEL-7.3_HVM_GA-20161026-x86_64*",
    ]
  }
}

data "template_file" "app_install" {
  template = "${file("${path.module}/template_files/install.tpl")}"

  vars {
    version= "${var.version}"
    os = "${var.os}"
    arch = "${var.arch}"
  }
}
