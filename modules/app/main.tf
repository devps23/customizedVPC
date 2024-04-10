//resource "aws_instance" "test" {
//  ami           = var.ami
//  instance_type = var.instancetype
//  vpc_security_group_ids = [data.aws_security_group.security.id]
//  tags = {
//    Name = var.instancename
//  }
//}
data "aws_security_group" "security"{
  name = "allow-all"
}
resource "aws_vpc" "vpc" {
  cidr_block       = var.cidr_block
  tags = {
    Name = var.vpcname
  }
}
//[id=vpc-005b54b715e988e73]
resource "aws_subnet" "subnet_dev" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.cidr_block

  tags = {
    Name = var.subnet_name
  }
}
//[id=subnet-0a28345179c03762b]
resource "aws_vpc_peering_connection" "peer" {
  peer_vpc_id   = var.requester_vpc_id
  vpc_id        = aws_vpc.vpc.id
  auto_accept   = true

  tags = {
    Name = var.peer_conn
  }
  //[id=pcx-036439135bf21c6be]
}
resource "aws_route_table" "route" {
  vpc_id = aws_vpc.vpc.id
}

//resource "aws_route_table" "router" {
//  vpc_id = aws_vpc.vpc.id
//  tags = {
//    Name = var.routename
//  }
//}
//resource "aws_route" "default_editroute" {
////  default routetableid
//  route_table_id = var.default_route_table_id//rtb--
//  //custom_Cidr_block
//  destination_cidr_block     = var.cidr_block//10.10.0.0
//  //peerconnection
//  vpc_peering_connection_id =  aws_vpc_peering_connection.peer.id//custom
//}
resource "aws_route" "cust_editroute" {
  //resource routetable id
  route_table_id = aws_vpc.vpc.default_route_table_id
  vpc_peering_connection_id = "pcx-04007ddaacb9d7c26"
// for aws route table id with default vpc  peer connection
  destination_cidr_block     = var.default_vpc_cidr_block

}
//
//output "custompeer" {
//  value = aws_vpc_peering_connection.peer.id
//}

