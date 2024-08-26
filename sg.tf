resource "aws_security_group" "ec2_sg" {
  description = "Kans EC2 Security Group"
  vpc_id      = aws_vpc.kans_vpc.id
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "Kans-SG"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ec2_sg_ssh" {
  security_group_id = aws_security_group.ec2_sg.id
  from_port         = 22
  to_port           = 22
  ip_protocol       = "tcp"
  cidr_ipv4         = var.sg_ingress_ssh_cidr
}

resource "aws_vpc_security_group_ingress_rule" "ec2_sg_all" {
  security_group_id = aws_security_group.ec2_sg.id
  # from_port         = 0
  # to_port           = 0
  ip_protocol       = "-1"
  cidr_ipv4         = var.vpc_block
}