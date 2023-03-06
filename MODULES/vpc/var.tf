variable "vpc_cidr" {
  type = string
}

variable "Name_VPC" {
}
variable "Owner" {
  type = string
  description = "Value used for tagging Owner"
}

variable "Purpose" {
  type = string
  description = "Purpose of the infrastructure creation"
}
