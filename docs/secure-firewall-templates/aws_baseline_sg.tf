variable "vpc_id" {
  description = "The VPC ID where this security group will be created"
  type        = string
}

resource "aws_security_group" "baseline_sg" {
  name        = "baseline-sg"
  description = "Baseline SG with no inline rules"
  vpc_id      = var.vpc_id

  tags = {
    Name = "baseline-sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "ssh" {
  security_group_id = aws_security_group.baseline_sg.id
  description        = "SSH from trusted IP"
  from_port          = 22
  to_port            = 22
  protocol           = "tcp"
  cidr_ipv4          = "YOUR_TRUSTED_IP/32" # e.g. VPN IP
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.baseline_sg.id
  description        = "HTTP from anywhere"
  from_port          = 80
  to_port            = 80
  protocol           = "tcp"
  cidr_ipv4          = "0.0.0.0/0"
}

resource "aws_vpc_security_group_egress_rule" "all" {
  security_group_id = aws_security_group.baseline_sg.id
  description        = "Allow all outbound traffic"
  from_port          = 0
  to_port            = 0
  protocol           = "-1"
  cidr_ipv4          = "0.0.0.0/0"
}
