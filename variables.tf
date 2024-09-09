variable "aws_region" {
  description = "The AWS region in which to create resources."
  default     = "us-east-1"
}

variable "aws_include_local_zones" {
  description = "Set to true to include Local Zones in the list of Availability Zones."
  default     = false
}