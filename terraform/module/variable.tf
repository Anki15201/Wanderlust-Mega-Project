variable "ami_id" {
  description = "to get image from aws"
  type    = string
}

variable "public_key" {
  description = "public key"
  type    = string
}

variable "env" {
  description = "Environment"
  type    = string
}

variable "instance_type" {
  description = "the rsource i want"
  type    = string
}

variable "availability_zone" {
  description = "availability zone"
  type    = string
}

variable "disk_size" {
  description = "disk storage"
  type    = number
}

variable "allowed_ports" {
  description = "to allow the incoming traffic"
  type    = list(number)
}

variable "vpc_cidr" {
  description = "IP ranges"
  type    = string
}

variable "public_subnet" {
  description = "public Subnet IP ranges"
  type    = string
}

/*
variable "private_subnet" {
  description = "private Subnet IP ranges"
  type    = string
}

variable "image_ami" {
  description = "to get image from aws"
  type    = string
}

*/










