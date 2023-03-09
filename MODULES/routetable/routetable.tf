resource "aws_route_table" "EKS_Rtbl" {
  vpc_id = "${var.vpc_id}"

   route {
    cidr_block = var.cidr_block
    gateway_id = "${var.igw_id}"
  }

   tags = {
    Name = "${var.Name_RT}"
    Purpose ="${var.Purpose}"
    Owner = "${var.Owner}"
  }
}
/////output
output "route_table_id" { value = "${aws_route_table.EKS_Rtbl.id}" }


