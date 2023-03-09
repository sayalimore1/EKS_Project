 resource "aws_route_table_association" "route_pub" {

  for_each = var.subnet_id
  subnet_id =  each.value
  route_table_id = "${var.route_table_id}"
}


/////output
# output "routeassociation_id" { value = "${aws_route_table_association.route_pub.id}" }
output "routeassociation_id" {
    value = tomap({
        for k, s in aws_route_table_association.route_pub : k => s.id
    })
  
}


  
