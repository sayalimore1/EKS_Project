variable "vpc_cidr" {
  default = "10.0.1.0/24"
}
variable "Name_VPC" {
 default = "EKS_vpc"
}
variable "Owner" {
  type = string
  description = "Value used for tagging Owner"
  default = "Sayali"
}

variable "Purpose" {
  type = string
  description = "Purpose of the infrastructure creation"
  default = "EKSProject"
}