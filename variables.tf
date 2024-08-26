variable "key_name" {
  description = "Name of an existing EC2 KeyPair to enable SSH access to the instances."
  type        = string
}

variable "sg_ingress_ssh_cidr" {
  description = "The IP address range that can be used to communicate to the EC2 instances."
  type        = string
  default     = "0.0.0.0/0"
}

variable "my_instance_type" {
  description = "Enter EC2 Type(Spec) Ex) t2.micro."
  type        = string
  default     = "t3.small"
}

variable "latest_ami_id" {
  description = "(DO NOT CHANGE)"
  type        = string
  default     = "/aws/service/canonical/ubuntu/server/22.04/stable/current/amd64/hvm/ebs-gp2/ami-id"
}

variable "target_region" {
  type    = string
  default = "ap-northeast-2"
}

variable "availability_zone1" {
  type    = string
  default = "ap-northeast-2a"
}

variable "availability_zone2" {
  type    = string
  default = "ap-northeast-2c"
}

variable "vpc_block" {
  type    = string
  default = "192.168.0.0/16"
}

variable "public_subnet1_block" {
  type    = string
  default = "192.168.50.0/24"
}

variable "public_subnet2_block" {
  type    = string
  default = "192.168.60.0/24"
}