provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "one" {
  count                  = 4
  ami                    = "ami-02d26659fd82cf299"
  instance_type          = "t3.micro"
  key_name               = "jn"
  vpc_security_group_ids = ["sg-00c55c8fe13c6465d"]
  tags = {
    Name = var.instance_names[count.index]
  }
}

variable "instance_names" {
  default = ["jenkins", "tomcat-1", "tomcat-2", "Monitoring server"]
}
