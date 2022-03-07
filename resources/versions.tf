terraform {

  backend "s3" {
    bucket  = "terraform-923147149783"
    key     = "terraform-state/resources"
    region  = "ap-southeast-2"
    encrypt = true
  }

  required_version = ">= 1.1.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.35"
    }
  }
}