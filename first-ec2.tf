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

provider "github" {
  token = var.github_token
}
resource "github_repository" "example" {
  name = "example"
  description = "mine"
  visibility = "public"
}

