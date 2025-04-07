resource "aws_vpc" "vpc" {
  
cidr_block = var.vpc-cidr-block

tags = {
    Name = var.vpc-name
}
}

resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.vpc.id
    tags = {
        Name = "App-igw"
    }
}

resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.Public_subnet1
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-subnet-1"
  }
}
resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.Public_subnet2
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "Public-subnet-2"
  }
}
resource "aws_subnet" "private1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnet1
  availability_zone = "us-east-1a"

  tags = {
    Name = "Private-subnet-1"
  }
}
resource "aws_subnet" "private2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnet2
  availability_zone = "us-east-1b"

  tags = {
    Name = "Private-subnet-2"
  }
}
resource "aws_subnet" "private3" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnet3
  availability_zone = "us-east-1a"

  tags = {
    Name = "Private-subnet-3"
  }
}
resource "aws_subnet" "private4" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.private_subnet4
  availability_zone = "us-east-1b"

  tags = {
    Name = "Private-subnet-4"
  }
}
resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}
resource "aws_route_table_association" "Assocition1" {
  subnet_id = aws_subnet.public1.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_route_table_association" "Assocition2" {
  subnet_id = aws_subnet.public2.id
  route_table_id = aws_route_table.public-rt.id
}

resource "aws_db_subnet_group" "mysql" {
  name       = "db_subnet"
  subnet_ids = [aws_subnet.private3.id, aws_subnet.private4.id]
  tags = {
    Name = "db-subnet"
  }
}