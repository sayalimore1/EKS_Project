provider "aws" {
  region = "ap-south-1"
}

module "EKS_vpc" {
  source      = "../modules/vpc"
  vpc_cidr    = var.vpc_cidr
  Name_VPC  = var.Name_VPC
  Owner = var.Owner
  Purpose = var.Purpose
}
module "EKS_igw" {
  source      = "../modules/internetgw"
  vpc_id      = "${module.EKS_vpc.vpc_id}"
  Name_IG  = var.Name_IG
  Owner = var.Owner
  Purpose = var.Purpose
}
