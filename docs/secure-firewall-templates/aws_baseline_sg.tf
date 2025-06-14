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

# SSH from trusted IP
resource "aws_vpc_security_group_rule" "ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["YOUR_TRUSTED_IP/32"]
  security_group_id = aws_security_group.baseline_sg.id
  description       = "SSH from trusted IP"
}

# HTTP from anywhere
resource "aws_vpc_security_group_rule" "http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.baseline_sg.id
  description       = "HTTP from anywhere"
}

# Allow all outbound traffic
resource "aws_vpc_security_group_rule" "all" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.baseline_sg.id
  description       = "Allow all outbound traffic"
}