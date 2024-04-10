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
resource "aws_subnet" "subnet_dev" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.cidr_block

  tags = {
    Name = var.subnet_name
  }
}
resource "aws_vpc_peering_connection" "peer" {
  peer_vpc_id   = var.requester_vpc_id
  vpc_id        = aws_vpc.vpc.id
  auto_accept   = true

  tags = {
    Name = var.peer_conn
  }

}
resource "aws_route_table" "router" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = var.routename
  }
}
resource "aws_route" "default_editroute" {
//  default routetableid
  route_table_id = var.default_route_table_id
  //custom_Cidr_block
  destination_cidr_block     = var.cidr_block
  //peerconnection
  vpc_peering_connection_id =  aws_vpc_peering_connection.peer.id
}
resource "aws_route" "cust_editroute" {
  //resource routetable id
  route_table_id = aws_vpc.vpc.default_route_table_id
// for aws route table id with default vpc  peer connection
  destination_cidr_block     = var.default_vpc_cidr_block
  vpc_peering_connection_id = var.default_peerConn
}

