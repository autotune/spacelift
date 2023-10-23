terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      // version = ">= 4.46"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.18.1"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14"
    }
  }
}

provider "aws" {
  region = var.region
}
