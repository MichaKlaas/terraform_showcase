## Terraform basic Configuration

# definition of the minimal terraform version which is required to execute this manifest
terraform {
  required_version = "~> 1.3"

  # definition of the requiered providers with compatible Versions.
  required_providers {
    aws = { # Required provider to talk to AWS.
      source  = "hashicorp/aws"
      version = "~> 4.0" # latest release of this provider in Version 4.x will be used.
    }

    random = { # Required provider to generate "random" values for strings
      source  = "hashicorp/random"
      version = "~> 3.0" # latest release of this provider in Version 3.x will be used.
    }

    #    null = {
    #      source  = "hashicorp/null"
    #      version = ">= 3.1.0"
    #    }
  }
}

# configure provider specific values
## The AWS Provider definition of the "region" This is required to authenticate terraform with the AWS API
provider "aws" {
  #  region = lookup(var.awsprops, "region")
  region = var.region
}

## Creation of the Ressource to generate random strings
resource "random_string" "suffix" {
  length  = 8
  special = false
}