terraform {
  cloud {
    organization = "kkumtree"
    workspaces {
      name = "kans-week3"
    }
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.66"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = var.aws_region
}