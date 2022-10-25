#vpc resource

resource "aws_vpc" "vpc" {

cidr_block = var.vpccidr

# cidr block iteration found in the terraform.tfvars file

tags = {

Name = var.vpc

}

}