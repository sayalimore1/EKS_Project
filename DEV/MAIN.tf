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

