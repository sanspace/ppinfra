resource "aws_instance" "web" {
  ami           = "ami-04893cdb768d0f9ee"
  instance_type = "t3.micro"
  key_name      = "perpilot-dev-key"
  user_data = templatefile(
    "${path.module}/init.tftpl",
    {
      java_version = "1.8.0"
    }
  )

  tags = {
    Name = "TestInstance"
  }
}

output "public_dns" {
  value = aws_instance.web.public_dns
}