
variable "vpc_id" {
   type = string
}

variable "subnettag" {
   type = string
}

#map of maps for create subnets

variable "subnets" {
   type = map
}
variable "Owner" {
  type = string
}

variable "Purpose" {
  type = string
}
