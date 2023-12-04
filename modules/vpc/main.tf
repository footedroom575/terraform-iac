
# vpc creation
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true
  tags = {
    Name = var.vpc_name
  }
}

# public subnet creation
resource "aws_subnet" "public_subnets" {
  count                   = length(var.public_subnets)
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.main.id
  availability_zone       = var.azs[count.index]
  cidr_block              = var.public_subnets[count.index]
  tags = {
    Name : "public-${count.index + 1}"
  }
}

# private subnet creation
resource "aws_subnet" "private_subnets" {
  count = length(var.private_subnets)

  vpc_id            = aws_vpc.main.id
  availability_zone = var.azs[count.index]
  cidr_block        = var.private_subnets[count.index]

  tags = {
    Name : "private-${count.index + 1}"
  }

}

# setting up internet gateway and linking with vpc
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name : "igw"
  }
}

# setting up route table for public subnets
resource "aws_route_table" "public-rtb" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name : "public-rtb"
  }
}

# setting up route table for private subnets
resource "aws_route_table" "private-rtbs" {
  count  = length(var.private_subnets)
  vpc_id = aws_vpc.main.id
  tags = {
    Name : "private-${count.index + 1}-rtb"
  }
}

# setting up route to access public traffic
resource "aws_route" "public" {
  route_table_id         = aws_route_table.public-rtb.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# linking rtb with public subnets
resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.public_subnets[*])
  route_table_id = aws_route_table.public-rtb.id
  subnet_id      = aws_subnet.public_subnets[count.index].id
}

# linking rtbs with private subnets
resource "aws_route_table_association" "private" {
  count          = length(aws_subnet.public_subnets[*])
  route_table_id = aws_route_table.private-rtbs[count.index].id
  subnet_id      = aws_subnet.private_subnets[count.index].id
}
