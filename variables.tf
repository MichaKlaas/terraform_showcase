########################################################################################################################
# Variables
########################################################################################################################

variable "region" {
  type        = string
  description = "the AWS region where to deploy the Manifest"
  default     = "eu-central-1"
}

variable "instance-device-type" {
  type        = string
  description = "device name from the instances"
  default     = "aws"
}

variable "instance-device-site-number" {
  type        = number
  description = "number value from the instances"
  default     = 200
}

variable "instance-device-business_unit" {
  type        = string
  description = "name from the ec2 instances"
  default     = "iti"
}

variable "instance-device-env" {
  type        = string
  description = "name from the ec2 instances"
  default     = "dev"
}

variable "instance-device-num" {
  type        = string
  description = "number value for the instances"
  default     = "001"
}

variable "awsprops" {
  type = map(any)
  default = {
    #region = "eu-central-1"
    ami          = "ami-0ec7f9846da6b0f61"
    itype        = "t2.micro"
    publicip     = false
#    keyname      = "myseckey"
    secgroupname = "IAC-Sec-Group"
  }
}