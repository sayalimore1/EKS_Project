variable "vpc_id" { type = string}
variable "secgrp_id" { type = string}

variable "Name_SG" {
  type = string
}
variable "protocal"{
    type = string
   
}
variable "Owner" {
  type = string
}

variable "Purpose" {
  type = string
}
variable "ingress_rules" {
  type        = map(any)
}