terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      // version = ">= 4.46"
    }
    random = {
      source = "hashicorp/random"
    }
  }
}
