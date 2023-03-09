variable "vpc_id" {
   type = string
}

#map of maps for create subnets
variable "pvtsubnets" {
   type = map

}
variable "Owner" {
  type = string
}

variable "Purpose" {
  type = string
}

variable "pvtsubnettag" {
  type = string
}
