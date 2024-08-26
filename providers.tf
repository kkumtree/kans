terraform {
  cloud {
    organization = "kkumtree"
    workspaces {
      name = "kans-week1"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.target_region
}