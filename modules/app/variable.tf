variable "ami" {}
variable "instancetype" {}
variable "instancename" {}
variable "cidr_block"{}
variable "vpcname"{}
variable "subnet_name" {}
variable "default_vpc_id" {}
variable "peer_conn" {}
variable "routename" {}
variable "default_vpc_cidr_block" {}
variable "default_route_table_id" {}
variable "default_peerConn" {}


output "peer_conn" {
  value = var.peer_conn
}
output "default_peerConn" {
  value = var.default_peerConn
}







