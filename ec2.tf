resource "aws_instance" "ec21" {
  ami           = var.latest_ami_id
  instance_type = var.my_instance_type
  key_name      = var.key_name
  root_block_device {
    volume_type           = "gp3"
    volume_size           = 30
    delete_on_termination = true
  }
  user_data                   = base64encode(local.user_data_ec21)
  subnet_id                   = aws_subnet.public_subnet1.id
  security_groups             = [aws_security_group.ec2_sg.id]
  # associate_public_ip_address = aws_subnet.public_subnet1.map_public_ip_on_launch ? null : true
  associate_public_ip_address = true
  private_ip                  = "192.168.50.10"
  tags = {
    Name = "MyServer"
  }
}