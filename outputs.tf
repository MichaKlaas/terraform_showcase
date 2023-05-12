output "ec2instance" {
  value = aws_instance.tf-showcase.private_ip
}