#Public Route Table T1 AZA

resource "aws_route_table" "public-aza" {

vpc_id = aws_vpc.vpc.id

route {

cidr_block = "0.0.0.0/0"

gateway_id = aws_internet_gateway.igw.id

}

tags = {

Name = "rtb-${var.region}-prd-aza-pub-t1-${var.ident}"

}

}

#Public Route Table T1 AZB

resource "aws_route_table" "public-azb" {

vpc_id = aws_vpc.vpc.id

route {

cidr_block = "0.0.0.0/0"

gateway_id = aws_internet_gateway.igw.id

}

tags = {

Name = "rtb-${var.region}-prd-azb-pub-t1-${var.ident}"

}

}

 

#Associate Public Route Table to Public Subnets

resource "aws_route_table_association" "public-aza" {

subnet_id = aws_subnet.sub-pub-t1-aza.id

route_table_id = aws_route_table.public-aza.id

}

 

resource "aws_route_table_association" "public-azb" {

subnet_id = aws_subnet.sub-pub-t1-azb.id

route_table_id = aws_route_table.public-azb.id

}


#Public Route Table T1 FW

resource "aws_route_table" "public-fw" {

vpc_id = aws_vpc.vpc.id

route = []

tags = {

Name = "rtb-${var.region}-prd-aza-pub-fw-${var.ident}"

}
}



#Associate Public Route Table to FW Subnets

resource "aws_route_table_association" "public-fw-aza" {

subnet_id = aws_subnet.sub-pub-fw-t1-aza.id

route_table_id = aws_route_table.public-fw.id

}

 

resource "aws_route_table_association" "public-fw-azb" {

subnet_id = aws_subnet.sub-pub-fw-t1-azb.id

route_table_id = aws_route_table.public-fw.id

}



#Private Route Table T1 VPCE AZA

resource "aws_route_table" "private-vpce-aza" {
  vpc_id = aws_vpc.vpc.id

  route = []
  
  tags = {
      Name = "rtb-${var.region}-prd-aza-pri-vpce-${var.ident}"
   
  }
}

#Associate Private Route Table to VPCE Subnets

resource "aws_route_table_association" "private-vpce-aza" {

subnet_id = aws_subnet.sub-pri-vpce-t1-aza.id

route_table_id = aws_route_table.private-vpce-aza.id

}


#Private Route Table T1 VPCE AZB

resource "aws_route_table" "private-vpce-azb" {
  vpc_id = aws_vpc.vpc.id

  route = []
  
  tags = {
      Name = "rtb-${var.region}-prd-azb-pri-vpce-${var.ident}"
   
  }
}


resource "aws_route_table_association" "private-vpce-azb" {

subnet_id = aws_subnet.sub-pri-vpce-t1-azb.id

route_table_id = aws_route_table.private-vpce-azb.id

}


#Public Route Table T1 TGA

resource "aws_route_table" "public-tga" {

vpc_id = aws_vpc.vpc.id

route = []

#cidr_block = var.vpccidr

tags = {

Name = "rtb-${var.region}-prd-pub-tga-${var.ident}"
}
}


#Associate Public Route Table to TGA Subnets

resource "aws_route_table_association" "public-tga-aza" {

subnet_id = aws_subnet.sub-pub-tga-t1-aza.id

route_table_id = aws_route_table.public-tga.id

}

 

resource "aws_route_table_association" "public-tga-azb" {

subnet_id = aws_subnet.sub-pub-tga-t1-azb.id

route_table_id = aws_route_table.public-tga.id

}




#Private Route Table T1 AZA

resource "aws_route_table" "private-aza" {

vpc_id = aws_vpc.vpc.id

route {

cidr_block = "0.0.0.0/0"

gateway_id = aws_nat_gateway.ngwaza.id

}

tags = {

Name = "rtb-${var.region}-prd-aza-prv-t1-${var.ident}"

}

}

#Private Route Table T1 AZB

resource "aws_route_table" "private-azb" {

vpc_id = aws_vpc.vpc.id

route {

cidr_block = "0.0.0.0/0"

gateway_id = aws_nat_gateway.ngwazb.id

}

tags = {

Name = "rtb-${var.region}-prd-azb-prv-t1-${var.ident}"

}

}


#Associate Private Route Table to Private Subnets

resource "aws_route_table_association" "private-t1-aza" {

subnet_id = aws_subnet.sub-pri-t1-aza.id

route_table_id = aws_route_table.private-aza.id

}

 

resource "aws_route_table_association" "private-t1-azb" {

subnet_id = aws_subnet.sub-pri-t1-azb.id

route_table_id = aws_route_table.private-azb.id

}




resource "aws_route_table_association" "private-t2-aza" {

subnet_id = aws_subnet.sub-pri-t2-aza.id

route_table_id = aws_route_table.private-aza.id

}

 

resource "aws_route_table_association" "private-t2-azb" {

subnet_id = aws_subnet.sub-pri-t2-azb.id

route_table_id = aws_route_table.private-azb.id

}

