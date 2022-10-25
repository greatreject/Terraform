#Elastic IP for NAT Gateway resource

resource "aws_eip" "nataza" {

vpc = true

tags = {

Name = "eip-nat-aza${var.ident}" }

}


#NAT Gateway object and attachment of the Elastic IP Address from above

resource "aws_nat_gateway" "ngwaza" {

allocation_id = aws_eip.nataza.id

subnet_id = aws_subnet.sub-pub-t1-aza.id

depends_on = [aws_internet_gateway.igw]

tags = {

 Name = "nat-${var.region}-aza-${var.ident}"

}
}

resource "aws_eip" "natazb" {

vpc = true

tags = {

Name = "eip-nat-azb${var.ident}" }

}

#NAT Gateway object and attachment of the Elastic IP Address from above

resource "aws_nat_gateway" "ngwazb" {

allocation_id = aws_eip.natazb.id

subnet_id = aws_subnet.sub-pub-t1-azb.id

depends_on = [aws_internet_gateway.igw]

tags = {

 Name = "nat-${var.region}-azb-${var.ident}"

}

}


#Internet Gateway

resource "aws_internet_gateway" "igw" {

vpc_id = aws_vpc.vpc.id

tags = {

Name = "igw-${var.region}-${var.ident}"

}

}