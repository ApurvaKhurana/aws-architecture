# vpc variables
variable "vpc_cidr" {
  description = "cidr range fro vpc"
  default     = "10.0.0.0/16"
}

variable "vpc_tenancy" {
  description = "instance tenancy"
  default     = "default"
}

#subnet variables
variable "availability_zone" {
  description = "availability_zone for subnet"
  default     = "ap-southeast-2a"
}

variable "public_subnet_cidr" {
  description = "cidr range for public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "cidr range for private subnet"
  default     = "10.0.2.0/24"
}
