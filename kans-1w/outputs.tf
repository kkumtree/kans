output "serverhost" {
  value = aws_instance.webserver.public_dns
}