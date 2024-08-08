data "aws_availability_zones" "available" {}

locals {
  public_subnet  = { for idx, subnet in var.public_subnets : idx => subnet }
  private_subnet = { for idx, subnet in var.private_subnets : idx => subnet }
  prefix         = var.prefix == "" ? "" : "${var.prefix}-"
}

resource "aws_vpc" "this" {
  tags = {
    Name = var.name
  }
  cidr_block           = var.cidr_block
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
}
