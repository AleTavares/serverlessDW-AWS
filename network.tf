####################
## Network - Main ##
####################

# AWS Availability Zones data
data "aws_availability_zones" "available" {}

######################################

# Create the VPC
resource "aws_vpc" "redshift-serverless-vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_hostnames = true

  tags = {
    Name        = "${var.app_name}-${var.app_environment}-redshift-serverless-vpc"
    Environment = var.app_environment
  }
}

######################################

# Create the Redshift Subnet AZ1
resource "aws_subnet" "redshift-serverless-subnet-az" {
  count = length(var.subnet_cidr_blocks)
  vpc_id            = aws_vpc.redshift-serverless-vpc.id
  cidr_block        = var.subnet_cidr_blocks[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name        = "${var.app_name}-${var.app_environment}-redshift-serverless-subnet-az${count.index}"
    Environment = var.app_environment
  }
}
