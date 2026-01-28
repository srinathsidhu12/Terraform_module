variable "vpc_cidr" {
  type        = string
  description = "cidr of vpc"
}

variable "public_subnet_cidr" {
  type        = string
  description = "cidr of public subnet"
}

variable "private_subnet_cidr" {
  type        = string
  description = "cidr of private subnet"
}

variable "environment" {
  description = "Environment name"
  type = string
}
