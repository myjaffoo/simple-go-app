data "aws_ami" "centos_ami" {
  most_recent = true

  filter {
    name = "description"

    values = [
      "CentOS Linux 6 x86_64 HVM EBS 1602",
    ]
  }
}

data "template_file" "app_install" {
  template = "${file("${path.module}/template_files/install.tpl")}"

  vars {}
}
