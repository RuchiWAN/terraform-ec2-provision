resource "aws_security_group" "baseline_sg" {
  name        = "baseline-sg"
  description = "Baseline Security Group with explicit ingress & egress"
  vpc_id      = var.vpc_id

  # Ingress — by default deny all unless explicitly allowed.
  # Example: allow SSH from trusted IP
  ingress {
    description = "SSH from trusted IP"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["YOUR_TRUSTED_IP/32"] # e.g. your VPN IP
  }

  # Example: allow HTTP from anywhere (web servers)
  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress — explicitly define what is allowed.
  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # All protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "baseline-sg"
  }
}
