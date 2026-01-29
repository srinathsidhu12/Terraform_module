variable "region" {
  type        = string
  default     = "ap-south-1"
  
}

variable "environment" {
  type        = string
  default     = "dev"
  
}

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

variable "ami" {
  type        = string
  description = "ami of instance"
}



variable "instance_type" {
  type        = string
  description = "ami of instance"
}

variable "instance_tag" {
  type        = string
  description = "tag of instance"
}