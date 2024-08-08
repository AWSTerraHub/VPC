resource "aws_subnet" "public" {
  for_each                = local.public_subnet
  vpc_id                  = aws_vpc.this.id
  cidr_block              = each.value
  availability_zone       = element(data.aws_availability_zones.available.names, each.key % length(data.aws_availability_zones.available.names))
  map_public_ip_on_launch = true
  tags = merge(
    {
      Name = "${local.prefix}-public-subnet${each.key + 1}"
      VPC  = aws_vpc.this.id
    },
  var.additional_tags)
}

resource "aws_subnet" "private" {
  for_each                = local.private_subnet
  vpc_id                  = aws_vpc.this.id
  cidr_block              = each.value
  availability_zone       = element(data.aws_availability_zones.available.names, each.key % length(data.aws_availability_zones.available.names))
  map_public_ip_on_launch = false
  tags = merge(
    {
      Name = "${local.prefix}-private-subnet${each.key + 1}"
      VPC  = aws_vpc.this.id
    },
  var.additional_tags)
}
