resource "aws_network_interface" "ec21" {
  subnet_id       = aws_subnet.public_subnet1.id
  security_groups = [aws_security_group.ec2_sg.id]

  private_ip = "192.168.50.10"
}

resource "aws_instance" "ec21" {
  ami           = var.latest_ami_id
  instance_type = var.my_instance_type
  key_name      = var.key_name
  network_interface {
    device_index         = 0
    network_interface_id = aws_network_interface.ec21.id
  }
  root_block_device {
    device_name           = "/dev/sda1"
    volume_type           = "gp3"
    volume_size           = 30
    delete_on_termination = true
  }
  user_data                   = base64encode(local.user_data_ec21)
  subnet_id                   = aws_subnet.public_subnet1.id
  security_groups             = [aws_security_group.ec2_sg.id]
  associate_public_ip_address = true
  private_ip                  = "192.168.50.10"
  tags = {
    Name = "MyServer"
  }
}