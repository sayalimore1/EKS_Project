resource "aws_internet_gateway" "EKS_igw" {
  vpc_id = "${var.vpc_id}"
   tags = {
    Name = "${var.Name_IG}"
    Purpose ="${var.Purpose}"
    Owner = "${var.Owner}"
  }
}

/////output 123
output "igw_id" { value = "${aws_internet_gateway.EKS_igw.id}" }