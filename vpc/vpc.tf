resource "aws_vpc" "main" {
  cidr_block = "${var.vpc_cidr_block}"

  tags {
    Name = "tooling-env"
  }
}

resource "aws_subnet" "public_subnet_1a" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${var.public_subnet_1a_cidr}"
  availability_zone       = "${data.aws_availability_zones.available.names[0]}"
  map_public_ip_on_launch = true

  tags {
    Name = "tooling-env-pub-1a"
  }
}

resource "aws_subnet" "public_subnet_1b" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${var.public_subnet_1b_cidr}"
  availability_zone       = "${data.aws_availability_zones.available.names[1]}"
  map_public_ip_on_launch = true

  tags {
    Name = "tooling-env-pub-1b"
  }
}

resource "aws_subnet" "public_subnet_1c" {
  vpc_id                  = "${aws_vpc.main.id}"
  cidr_block              = "${var.public_subnet_1c_cidr}"
  availability_zone       = "${data.aws_availability_zones.available.names[2]}"
  map_public_ip_on_launch = true

  tags {
    Name = "tooling-env-pub-1c"
  }
}

resource "aws_internet_gateway" "main" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "tooling-env"
  }
}

resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.main.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.main.id}"
}
