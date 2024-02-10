provider "aws" {
  region = "us-east-1"
}

variable "ami" {
    description = "AMI ID of the instance"
}

variable "instance_type" {
    description = "Instance type of the EC2 instance"
}

module "ec2-instance" {
    source = "./modules/ec2-instance" 
    ami = var.ami
    instance_type = var.instance_type
}