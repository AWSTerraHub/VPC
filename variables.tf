variable "region" {
  type        = string
  description = "AWS region where the resources or components will be deployed"
}

variable "name" {
  type        = string
  default     = "TerraHub"
  description = "Name of the VPC resource to be created. Default : TerraHub"
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
