resource "aws_vpc" "sample_vpc" {
  cidr_block       = var.vpc_cidr
  tags = {
    Name = "${var.environment}-vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.sample_vpc.id
  cidr_block = var.public_subnet_cidr

  tags = {
    Name = "${var.environment}-vpc-public-subnet"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.sample_vpc.id
  cidr_block = var.private_subnet_cidr

  tags = {
    Name = "${var.environment}-vpc-private-subnet"
  }
}

resource "aws_internet_gateway" "new_igw" {
  vpc_id = aws_vpc.sample_vpc.id

  tags = {
    Name = "${var.environment}-vpc-igw"
  }
}

resource "aws_eip" "nat_eip" {
  domain ="vpc"
  tags = {
    Name = "${var.environment}-vpc-natgatway-eip"
  }
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public.id

  tags = {
    Name = "${var.environment}-vpc-natgateway"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.sample_vpc.id
 
  tags = {
    Name = "${var.environment}-vpc-public-rt"
  } 
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.new_igw.id
  }
  route {
    cidr_block = var.vpc_cidr
    gateway_id = "local"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.sample_vpc.id
 
  tags = {
    Name = "${var.environment}-vpc-private-rt"
  } 
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  route {
    cidr_block = var.vpc_cidr
    gateway_id = "local"
  }
}

resource "aws_route_table_association" "public_assoc" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private_assoc" {
  subnet_id      = aws_subnet.private.id
  route_table_id = aws_route_table.private.id
}
