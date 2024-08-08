resource "aws_internet_gateway" "this" {
  depends_on = [aws_vpc.this]
  count      = length(var.public_subnets) >= 1 ? 1 : 0
  vpc_id     = aws_vpc.this.id

  tags = merge(
    {
      Name = "${local.prefix}-IGW"
      VPC  = aws_vpc.this.id
    },
  var.additional_tags)
}

resource "aws_route_table" "public" {
  count  = length(var.public_subnets) >= 1 ? 1 : 0
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this[0].id
  }

  tags = merge(
    {
      Name = "${local.prefix}-public-RT"
      VPC  = aws_vpc.this.id
    },
  var.additional_tags)
}

resource "aws_route_table" "private" {
  count  = length(var.private_subnets) >= 1 ? 1 : 0
  vpc_id = aws_vpc.this.id

  tags = merge(
    {
      Name = "${local.prefix}-private-RT"
      VPC  = aws_vpc.this.id
    },
  var.additional_tags)
}

