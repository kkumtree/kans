data "aws_availability_zones" "available" {
  all_availability_zones = var.aws_include_local_zones

  filter {
    name   = "state"
    values = ["available"]
  }
}

data "aws_availability_zone" "one" {
	name = data.aws_availability_zones.available.names[0]
}

data "aws_availability_zone" "two" {
	name = count(
		data.aws_availability_zones.available.names) < 2 ? null : count(
			data.aws_availability_zones.available.names) > 2 ? data.aws_availability_zones.available.names[2] : data.aws_availability_zones.available.names[1]
}