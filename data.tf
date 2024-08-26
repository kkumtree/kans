data "aws_ssm_parameter" "latest_ami_id" {
  name = var.latest_ami_id
}