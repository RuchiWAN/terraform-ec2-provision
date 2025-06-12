terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.99.1"  # or whatever stable version you're happy with
    }
  }
}

provider "aws" {
  region     = "eu-west-2"
}

resource "aws_instance" "myec2" {
  ami = "ami-0fc32db49bc3bfbb1"
  instance_type = "t2.micro"

tags = {
    Name = "1stInstanceAutomated"
  }

}

# provider "github" {
  # token = var.github_token

# resource "github_repository" "example" {
  #name = "example"
  #description = "mine"
  #visibility = "public"

#resource "aws_security_group" "web_sg" {
  #name        = "web-sg"
  #description = "Allow HTTP and SSH inbound traffic"

  #ingress {
    #from_port   = 80
    #to_port     = 80
    #protocol    = "tcp"
    #cidr_blocks = ["0.0.0.0/0"]
  

  #ingress {
    #from_port   = 22
    #to_port     = 22
    #protocol    = "tcp"
    #cidr_blocks = ["203.0.113.4/32"]  # Office/VPN IP
  

  #egress {
    #from_port   = 0
    #to_port     = 0
    #protocol    = "-1"
    #cidr_blocks = ["0.0.0.0/0"]
  



