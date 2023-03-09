variable "vpc_cidr" {
  default = "10.0.1.0/24"
}
variable "Name_VPC" {
 default = "EKS_vpc"
}

variable "Name_IG" {
 default = "EKS_internet gateway"
}

variable "Name_RT" {
 default = "EKS_route_table"
}

variable "Name_SG" {
 default = "EKS_sg"
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
variable "pvtsubnettag" {
  type = string
  default = "EKS_PVTSubnet"
}
variable "subnettag" {
   type = string
   default = "EKS_PUBSubnet"
}

#map of maps for create subnets
variable "subnets" {
   type = map
   default = {
      sub-1 = {
         az = "aps1-az1"
         cidr = "10.0.1.0/26"
      }
      sub-2 = {
         az = "aps1-az2"
         cidr = "10.0.1.64/26"
      }

}
}
variable "pvtsubnets" {
   type = map
   default = {
        sub-3 = {
         az2 = "aps1-az1"
         cidr2 = "10.0.1.128/26"
      }
      sub-4 = {
         az2 = "aps1-az2"
         cidr2 = "10.0.1.192/26"
      }
}
}

### Route Tables
variable "cidr_block" {
    type = string
    default = "0.0.0.0/0"
  
}

////security grp///
variable "protocal"{
    type = string  
    default = "tcp"
}

variable "ingress_rules" {
  default     = {
    "my ingress rule" = {
    
      "from_port"   = "80"
      "to_port"     = "80"
 
      "cidr_blocks" = ["0.0.0.0/0"]
    },
    "my other ingress rule" = {
      "from_port"   = "22"
      "to_port"     = "22"
      "cidr_blocks" = ["0.0.0.0/0"]
    }
  }
  type        = map(any)
  description = "Security group rules"
}