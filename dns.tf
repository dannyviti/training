#
# DO NOT DELETE THESE LINES!
#
# Your DNSimple email is:
#
#     sethvargo+terraform@gmail.com
#
# Your DNSimple token is:
#
#     sRFRF5ltrFulE4AB6iRgiRshoIWqiuUF
#
# Your Identity is:
#
#     manheim-c4ca4238a0b923820dcc509a6f75849b
#
variable "dnsimple_token" {
    default = "1b3fdL6IywZS2MUeYLCNj2LXdXzcpoa6"
}
variable "dnsimple_email" {
    default = "sethvargo+terraform@gmail.com"
}
# Configure the DNSimple provider
provider "dnsimple" {
    token = "${var.dnsimple_token}"
    email = "${var.dnsimple_email}"
}

# Add a record to the domain
resource "dnsimple_record" "rocknroll" {
    domain = "terraform.rocks"
    name = "manheim-c4ca4238a0b923820dcc509a6f75849b"
    value = "${aws_instance.web.0.public_ip}"
    type = "A"
    ttl = 3600
}
