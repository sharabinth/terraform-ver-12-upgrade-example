resource "aws_instance" "example" {
  ami           = "${var.ami}"
  instance_type = "t2.micro"

  tags = {
    Name = "TF 0.12 Upgrade"
  }
}

variable "ami" {
  type = "string"
}