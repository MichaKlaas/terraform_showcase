## Ressources which was created outside of this Manifest but will be used

## the VPC which is availible inside the used AWS account
data "aws_vpc" "available" {}

## the availible availability_zones inside the VPC
data "aws_availability_zones" "available" {}


## the availible subnets which are created inside the VPC
data "aws_subnets" "available" {}