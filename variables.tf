variable "region" {
  type        = string
  description = "AWS region where the resources or components will be deployed"
}

variable "name" {
  type        = string
  default     = "TerraHub"
  description = "Name of the VPC resource to be created. Default : TerraHub"
}

variable "prefix" {
  type        = string
  default     = ""
  description = "Prefix the VPC resources with a name of your choice. Default : None"
}

variable "cidr_block" {
  type        = string
  default     = "10.0.0.0/16"
  description = "CIDR block for the VPC resource"
}

variable "enable_dns_hostnames" {
  type        = bool
  default     = false
  description = "To enable dns hostname. Default : False"
}

variable "enable_dns_support" {
  type        = bool
  default     = false
  description = "To enable dns support. Default : False"
}

variable "public_subnets" {
  type        = list(string)
  default     = []
  description = "List of public subnets for the VPC resource. Default []"
}

variable "private_subnets" {
  type        = list(string)
  default     = []
  description = "List of private subnets for the VPC resource. Default []"
}

variable "additional_tags" {
  type        = map(string)
  default     = {}
  description = "Set of tags to allocate to the VPC resources. Name tag will be already allocated"
}
