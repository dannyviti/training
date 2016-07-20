#
# DO NOT DELETE THESE LINES!
#
# Your subnet ID is:
#
#     subnet-5a424367
#
# Your security group ID is:
#
#     sg-ca91a0b1
#
# Your AMI ID is:
#
#     ami-db24d8b6
#
# Your Identity is:
#
#     manheim-c4ca4238a0b923820dcc509a6f75849b
#  access_key = "AKIAI7FBXROISJRX36IQ"
#  secret_key = "Bn4goYddM4oApPRh5fmqX5ZmPhXSMNPiJPhfj0dS"
#  region     = "us-east-1"
#

variable "aws_access_key" {
  type = "string"
}
variable "aws_secret_key" {
  type = "string"
}
variable "aws_region" {
  type = "string"
  default = "us-east-1"
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.aws_region}"
}

resource "aws_instance" "web" {
  ami = "ami-db24d8b6"
  count = 2
  instance_type = "t2.micro"
  subnet_id = "subnet-5a424367"
  vpc_security_group_ids = ["sg-ca91a0b1"]
  tags {
    Identity = "manheim-c4ca4238a0b923820dcc509a6f75849b"
    Team = "Pretzel Time"
    Environment = "Horse Radish Mustard"
  }
}

output "public_ip" {
  value = "${join(", ", aws_instance.web.*.public_ip)}"
}

output "public_dns" {
  value = "${join(", ", aws_instance.web.*.public_dns)}"
}
