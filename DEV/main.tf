provider "aws" {
  region = "ap-south-1"
}

module "EKS_vpc" {
  source      = "git::https://github.com/sayalimore1/EKS_Project.git//MODULES/vpc" 
  vpc_cidr    = var.vpc_cidr
  Name_VPC  = var.Name_VPC
  Owner = var.Owner
  Purpose = var.Purpose
}

module "EKS_igw" {
  source      = "git::https://github.com/sayalimore1/EKS_Project.git//MODULES/internetgw"
  vpc_id      = "${module.EKS_vpc.vpc_id}"
  Name_IG  = var.Name_IG
  Owner = var.Owner
  Purpose = var.Purpose
}

module "EKS_rttbl" {
  source      = "git::https://github.com/sayalimore1/EKS_Project.git//MODULES/routetable"
  vpc_id      = "${module.EKS_vpc.vpc_id}"
  igw_id = "${module.EKS_igw.igw_id}"
  cidr_block = var.cidr_block
  Name_RT  = var.Name_RT
  Owner = var.Owner
  Purpose = var.Purpose
  }

  module "EKS_SCGP" {
  source      = "git::https://github.com/sayalimore1/EKS_Project.git//MODULES/securitygrp"
  vpc_id      = "${module.EKS_vpc.vpc_id}"
  ingress_rules    = var.ingress_rules
  Name_SG  = var.Name_SG
  Owner  = var.Owner
  Purpose  = var.Purpose
  protocal = var.protocal
  secgrp_id   = "${module.EKS_SCGP.secgrp_id}"
  }

  module "EKS_subnets" {
  source      = "git::https://github.com/sayalimore1/EKS_Project.git//MODULES/subnets"
  vpc_id    =  "${module.EKS_vpc.vpc_id}"
  subnets = var.subnets
  subnettag  = var.subnettag
  Owner  = var.Owner
  Purpose  = var.Purpose
  }
  module "EKS_Pvtsubnets" {
  source      = "git::https://github.com/sayalimore1/EKS_Project.git//MODULES/pvtsubnet"
  vpc_id    =  "${module.EKS_vpc.vpc_id}"
  pvtsubnets = var.pvtsubnets
  pvtsubnettag  = var.pvtsubnettag
  Owner  = var.Owner
  Purpose  = var.Purpose
  }

  module "EKS_routeassociation" {
  source      = "git::https://github.com/sayalimore1/EKS_Project.git//MODULES/routeassociation"
  route_table_id = "${module.EKS_rttbl.route_table_id}"
  subnet_id = "${module.EKS_subnets.subnet_id}"


}

output "infra"{
  value = [module.EKS_vpc.vpc_id,module.EKS_igw.igw_id,module.EKS_rttbl.route_table_id,module.EKS_subnets.subnet_id,module.EKS_routeassociation.routeassociation_id,module.EKS_SCGP.secgrp_id,module.EKS_Pvtsubnets.pvtsubnet_id]
}
