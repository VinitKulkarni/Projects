# Create a VPC
resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr_block
  tags = {
    Name = "myvpc"
  }
}

# public subnet-1
resource "aws_subnet" "publicSubnet1" {
  vpc_id                  = aws_vpc.myvpc.id
  cidr_block              = var.publicSubnet_cidr_block
  availability_zone       = var.availability_zone_public_subnet
  map_public_ip_on_launch = true
}

# private subnet-1
resource "aws_subnet" "privateSubnet1" {
  vpc_id            = aws_vpc.myvpc.id
  cidr_block        = var.privateSubnet_cidr_block
  availability_zone = var.availability_zone_public_subnet
  #map_public_ip_on_launch = true #Dont want public_ip address
}

# Internet gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.myvpc.id
}

# Public Route Table
resource "aws_route_table" "publicRouteTable" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

# Associate the public subnet with the public route table
resource "aws_route_table_association" "public_subnet_association" {
  subnet_id      = aws_subnet.publicSubnet1.id
  route_table_id = aws_route_table.publicRouteTable.id
}

# Create an Elastic IP for the NAT Gateway
resource "aws_eip" "eip" {
  depends_on = [aws_internet_gateway.igw]
}

# create NAT-gateway
resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.publicSubnet1.id

  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.igw]
}

# Private Route Table
resource "aws_route_table" "privateRouteTable" {
  vpc_id = aws_vpc.myvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat.id
  }
}

# Associate the private subnet with the private route table
resource "aws_route_table_association" "private_subnet_association" {
  subnet_id      = aws_subnet.privateSubnet1.id
  route_table_id = aws_route_table.privateRouteTable.id
}

//key pair making, ready to attach
resource "aws_key_pair" "vinitkey" {
  key_name   = "vinit-key"
  public_key = file("~/.ssh/vinit-key.pub")
}

//security group making ready to attach
resource "aws_security_group" "my_security_group" {
  vpc_id = aws_vpc.myvpc.id

  # Ingress: Allow SSH from anywhere (Change as needed)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress: Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my_security_group"
  }
}

#private ec2 security group
resource "aws_security_group" "myprivate_security_group" {
  vpc_id = aws_vpc.myvpc.id

  # Ingress: Allow SSH from anywhere (Change as needed)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Egress: Allow all outbound traffic
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my_security_group"
  }
}

#public ec2 instance
resource "aws_instance" "publicInstance" {
  ami                         = "ami-0e35ddab05955cf57" # Replace with the correct AMI ID for your region
  instance_type               = "t2.nano"               # Change the instance type if necessary
  key_name                    = aws_key_pair.vinitkey.key_name
  security_groups             = [aws_security_group.my_security_group.id]
  subnet_id                   = aws_subnet.publicSubnet1.id
  associate_public_ip_address = true
  tags = {
    Name = "PublicTerraformInstance"
  }
}

#private ec2 instance
resource "aws_instance" "privateInstance" {
  ami                         = "ami-0e35ddab05955cf57" # Replace with the correct AMI ID for your region
  instance_type               = "t2.nano"               # Change the instance type if necessary
  key_name                    = aws_key_pair.vinitkey.key_name
  security_groups             = [aws_security_group.myprivate_security_group.id]
  subnet_id                   = aws_subnet.privateSubnet1.id
  associate_public_ip_address = false
  tags = {
    Name = "PrivateFromTerraformInstance"
  }
}
