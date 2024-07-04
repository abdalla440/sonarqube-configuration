variable "region" {
  description = "The AWS region in which the resources will be created."
  type        = string
  default     = "us-east-1"
}

variable "availability_zone" {
  description = "The availability zone where the resources will reside."
  type        = string
  default     = "us-east-1a"
}

variable "ami" {
  description = "The AMI used to create the EC2 instance.(Canonical, Ubuntu Server 22.04 LTS)"
  type        = string
  default     = "ami-0e001c9271cf7f3b9"
}

variable "instance_type" {
  description = "The type of EC2 instance used to create the instance."
  type        = string
  default     = "t2.medium"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC."
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "The CIDR block for the subnet."
  type        = string
  default     = "10.0.1.0/24"
}

variable "ssh_key_name" {
  description = "The name of the SSH key pair to use for the instance."
  type        = string
  default     = "pwc-instances-key"
}