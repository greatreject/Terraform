#Public Subnet t1 aza

resource "aws_subnet" "sub-pub-t1-aza" {

cidr_block = var.sub-pub-t1-aza

# public subnet 1 cidr block iteration found in the terraform.tfvars file

vpc_id = aws_vpc.vpc.id

map_public_ip_on_launch = true

availability_zone = data.aws_availability_zones.available.names[0]

#0 indicates the first AZ

tags = {

Name = "sbn-${var.region}-prd-aza-pub-t1-${var.ident}"

}

}

 

#Public Subnet t1 azb

resource "aws_subnet" "sub-pub-t1-azb" {

cidr_block = var.sub-pub-t1-azb

# public subnet 2 cidr block iteration found in the terraform.tfvars file

vpc_id = aws_vpc.vpc.id

map_public_ip_on_launch = true

availability_zone = data.aws_availability_zones.available.names[1]

#1 indicates the second AZ

tags = {

Name = "sbn-${var.region}-prd-azb-pub-t1-${var.ident}"

}

}


#Public Subnet t1 FW aza

resource "aws_subnet" "sub-pub-fw-t1-aza" {

cidr_block = var.sub-pub-fw-t1-aza

# public subnet 1 cidr block iteration found in the terraform.tfvars file

vpc_id = aws_vpc.vpc.id

map_public_ip_on_launch = true

availability_zone = data.aws_availability_zones.available.names[0]

#0 indicates the first AZ

tags = {

Name = "sbn-${var.region}-prd-aza-pub-t1-fw-${var.ident}"

}

}

 

#Public Subnet t1 FW azb

resource "aws_subnet" "sub-pub-fw-t1-azb" {

cidr_block = var.sub-pub-fw-t1-azb

# public subnet 2 cidr block iteration found in the terraform.tfvars file

vpc_id = aws_vpc.vpc.id

map_public_ip_on_launch = true

availability_zone = data.aws_availability_zones.available.names[1]

#1 indicates the second AZ

tags = {

Name = "sbn-${var.region}-prd-azb-pub-t1-fw-${var.ident}"

}

}


#Public Subnet t1 TGA aza

resource "aws_subnet" "sub-pub-tga-t1-aza" {

cidr_block = var.sub-pub-tga-t1-aza

# public subnet 1 cidr block iteration found in the terraform.tfvars file

vpc_id = aws_vpc.vpc.id

map_public_ip_on_launch = true

availability_zone = data.aws_availability_zones.available.names[0]

#0 indicates the first AZ

tags = {

Name = "sbn-${var.region}-prd-aza-pub-t1-tga-${var.ident}"

}

}

 

#Public Subnet t1 TGA azb

resource "aws_subnet" "sub-pub-tga-t1-azb" {

cidr_block = var.sub-pub-tga-t1-azb

# public subnet 2 cidr block iteration found in the terraform.tfvars file

vpc_id = aws_vpc.vpc.id

map_public_ip_on_launch = true

availability_zone = data.aws_availability_zones.available.names[1]

#1 indicates the second AZ

tags = {

Name = "sbn-${var.region}-prd-azb-pub-t1-tga-${var.ident}"

}

}


#Public Subnet t1 VPCE aza

resource "aws_subnet" "sub-pri-vpce-t1-aza" {

cidr_block = var.sub-pri-vpce-t1-aza

# public subnet 1 cidr block iteration found in the terraform.tfvars file

vpc_id = aws_vpc.vpc.id

map_public_ip_on_launch = true

availability_zone = data.aws_availability_zones.available.names[0]

#0 indicates the first AZ

tags = {

Name = "sbn-${var.region}-prd-aza-pri-t1-vpce-${var.ident}"

}

}

 

#Public Subnet t1 VPCE azb

resource "aws_subnet" "sub-pri-vpce-t1-azb" {

cidr_block = var.sub-pri-vpce-t1-azb

# public subnet 2 cidr block iteration found in the terraform.tfvars file

vpc_id = aws_vpc.vpc.id

map_public_ip_on_launch = true

availability_zone = data.aws_availability_zones.available.names[1]

#1 indicates the second AZ

tags = {

Name = "sbn-${var.region}-prd-azb-pri-t1-vpce-${var.ident}"

}

}





#Private Subnet t1 aza

resource "aws_subnet" "sub-pri-t1-aza" {

cidr_block = var.sub-pri-t1-aza

# private subnet 1 cidr block iteration found in the terraform.tfvars file

vpc_id = aws_vpc.vpc.id

map_public_ip_on_launch = false

availability_zone = data.aws_availability_zones.available.names[0]

tags = {

Name = "sbn-${var.region}-prd-aza-prv-t1-${var.ident}"

}

}

 

#Private Subnet t1 azb

resource "aws_subnet" "sub-pri-t1-azb" {

cidr_block = var.sub-pri-t1-azb

# private subnet 2 cidr block iteration found in the terraform.tfvars file

vpc_id = aws_vpc.vpc.id

map_public_ip_on_launch = false

availability_zone = data.aws_availability_zones.available.names[1]

tags = {

Name = "sbn-${var.region}-prd-azb-prv-t1-${var.ident}"

}

}

 

#Private Subnet t2 aza

resource "aws_subnet" "sub-pri-t2-aza" {

cidr_block = var.sub-pri-t2-aza

# private subnet 3 cidr block iteration found in the terraform.tfvars file

vpc_id = aws_vpc.vpc.id

map_public_ip_on_launch = false

availability_zone = data.aws_availability_zones.available.names[0]

tags = {

Name = "sbn-${var.region}-prd-aza-prv-t2-${var.ident}"

}

}

#Private Subnet t2 azb

resource "aws_subnet" "sub-pri-t2-azb" {

cidr_block = var.sub-pri-t2-azb

# private subnet 3 cidr block iteration found in the terraform.tfvars file

vpc_id = aws_vpc.vpc.id

map_public_ip_on_launch = false

availability_zone = data.aws_availability_zones.available.names[1]

tags = {

Name = "sbn-${var.region}-prd-azb-prv-t2-${var.ident}"

}

}