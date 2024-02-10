provider "aws" {
    region = "us-east-1"
}

variable "ami" {
    description = "This is AMI ID for the instance "
}

variable "instance_type" {
    description = "This is the instance type, for example: t2.micro"
}

resource "aws_instance" "workspaces" {
    ami = var.ami
    instance_type = var.instance_type
}