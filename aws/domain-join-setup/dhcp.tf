resource "aws_vpc_dhcp_options" "ad" {
  domain_name          = "mphasis.com"
  domain_name_servers  = ["${var.domain_dns_ip}", "AmazonProvidedDNS"]

  tags {
    Name = "ActiveDirectory"
  }
}

resource "aws_vpc_dhcp_options_association" "ad" {
  vpc_id          = "${var.vpc_id}"
  dhcp_options_id = "${aws_vpc_dhcp_options.ad.id}"
}