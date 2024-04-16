resource "aws_subnet" "public" {
  count                   = var.az_limit
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(cidrsubnet(aws_vpc.this.cidr_block, 1, 1), var.az_limit - 1, count.index)
  availability_zone       = data.aws_availability_zones.this.names[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name = "sub-public-${data.aws_availability_zones.this.names[count.index]}"
  }

}

resource "aws_subnet" "private" {
  count                   = var.az_limit
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(cidrsubnet(aws_vpc.this.cidr_block, 1, 0), var.az_limit - 1, count.index)
  availability_zone       = data.aws_availability_zones.this.names[count.index]
  map_public_ip_on_launch = false

  tags = {
    Name = "sub-private-${data.aws_availability_zones.this.names[count.index]}"
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "igw-${var.vpc_name}"
  }
}

resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  route {
    cidr_block = var.vpc_cidr
    gateway_id = "local"
  }

  tags = {
    Name = "rt-${var.vpc_name}"
  }
}

resource "aws_route_table_association" "rta_private" {
  count          = var.az_limit
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.rt.id
}

resource "aws_route_table_association" "rta_public" {
  count          = var.az_limit
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.rt.id
}