resource "aws_network_acl" "private" {
  vpc_id = aws_vpc.vpc.id

  egress {
    protocol   = "all"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "acl-${var.region}-${var.ident}-prv-t1"
  }
}

resource "aws_network_acl_association" "private1" {
  network_acl_id = aws_network_acl.private.id
  subnet_id      = aws_subnet.sub-pri-t1-aza.id
}

resource "aws_network_acl_association" "private2" {
  network_acl_id = aws_network_acl.private.id
  subnet_id      = aws_subnet.sub-pri-t1-azb.id
}

resource "aws_network_acl_association" "private3" {
  network_acl_id = aws_network_acl.private.id
  subnet_id      = aws_subnet.sub-pri-t2-aza.id
}

resource "aws_network_acl_association" "private4" {
  network_acl_id = aws_network_acl.private.id
  subnet_id      = aws_subnet.sub-pri-t2-azb.id
}

resource "aws_network_acl_association" "private5" {
  network_acl_id = aws_network_acl.private.id
  subnet_id      = aws_subnet.sub-pri-vpce-t1-aza.id
}

resource "aws_network_acl_association" "private6" {
  network_acl_id = aws_network_acl.private.id
  subnet_id      = aws_subnet.sub-pri-vpce-t1-azb.id
}


resource "aws_network_acl" "firewall" {
  vpc_id = aws_vpc.vpc.id

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }
  egress {
    protocol   = "tcp"
    rule_no    = 210
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }
  egress {
    protocol   = "tcp"
    rule_no    = 220
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1025
    to_port    = 65535
  }
  egress {
    protocol   = "icmp"
    rule_no    = 230
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
	icmp_type = -1
    icmp_code = -1
  }
  egress {
    protocol   = "tcp"
    rule_no    = 240
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 22
    to_port    = 22
  }
  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }
  ingress {
    protocol   = "tcp"
    rule_no    = 110
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }
  ingress {
    protocol   = "tcp"
    rule_no    = 120
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 1025
    to_port    = 65535
  }
  ingress {
    protocol   = "icmp"
    rule_no    = 130
    action     = "allow"
    cidr_block = "0.0.0.0/0"
	from_port  = 0
    to_port    = 0
	icmp_type = -1
    icmp_code = -1
  }
  tags = {
    Name = "acl-${var.region}-qas-pub-fw-${var.ident}"
  }
}

resource "aws_network_acl_association" "public1" {
  network_acl_id = aws_network_acl.firewall.id
  subnet_id      = aws_subnet.sub-pub-t1-aza.id
}

resource "aws_network_acl_association" "public2" {
  network_acl_id = aws_network_acl.firewall.id
  subnet_id      = aws_subnet.sub-pub-t1-azb.id
}

resource "aws_network_acl_association" "fw-aza" {
  network_acl_id = aws_network_acl.firewall.id
  subnet_id      = aws_subnet.sub-pub-fw-t1-aza.id
}

resource "aws_network_acl_association" "fw-azb" {
  network_acl_id = aws_network_acl.firewall.id
  subnet_id      = aws_subnet.sub-pub-fw-t1-azb.id
}

resource "aws_network_acl" "tga" {
  vpc_id = aws_vpc.vpc.id

  egress {
    protocol   = "all"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  ingress {
    protocol   = "all"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }

  tags = {
    Name = "acl-${var.region}-qas-tga-${var.ident}"
  }
}

resource "aws_network_acl_association" "tga-aza" {
  network_acl_id = aws_network_acl.tga.id
  subnet_id      = aws_subnet.sub-pub-tga-t1-aza.id
}

resource "aws_network_acl_association" "tga-azb" {
  network_acl_id = aws_network_acl.tga.id
  subnet_id      = aws_subnet.sub-pub-tga-t1-azb.id
}
