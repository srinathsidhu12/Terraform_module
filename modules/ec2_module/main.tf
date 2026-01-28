resource "aws_instance" "new_instance" {
  ami           = var.ami
  instance_type = var.instance_type
  subnet_id = var.subnet_id

  tags = {
    Name = var.instance_tag
  }
}