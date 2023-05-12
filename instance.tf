########################################################################################################################
# Instances
########################################################################################################################

## EC2 Instance
resource "aws_instance" "tf-showcase" {
  ami           = lookup(var.awsprops, "ami")
  instance_type = lookup(var.awsprops, "itype")
  #  subnet_id = lookup(var.awsprops, "subnet") #FFXsubnet2
  subnet_id                   = data.aws_subnets.available.ids["${var.subnet-count}"]
  associate_public_ip_address = lookup(var.awsprops, "publicip")
  #key_name                    = lookup(var.awsprops, "keyname")


  vpc_security_group_ids = [
    aws_security_group.tf-showcase-sg.id
  ]
  root_block_device {
    delete_on_termination = true
    iops                  = 150
    volume_size           = 50
    #volume_type           = "gp2"
  }
  tags = {
    Name        = "MiKa_showcase-${upper("${var.instance-device-type}${var.instance-device-site-number}${var.instance-device-business_unit}${var.instance-device-env}${var.instance-device-num}")}"
    Environment = "DEV"
    OS          = "UBUNTU"
    Managed     = "IAC"
  }

  depends_on = [aws_security_group.tf-showcase-sg]
}












## Security Group for EC2 Instance
resource "aws_security_group" "tf-showcase-sg" {
  name        = lookup(var.awsprops, "secgroupname")
  description = lookup(var.awsprops, "secgroupname")
  vpc_id      = data.aws_vpc.available.id
  #vpc_id = lookup(var.awsprops, "vpc")

  // To Allow SSH Transport
  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  // To Allow Port 80 Transport
  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}


