provider "aws" {
  region = "us-east-1"
}

variable "ami" {
    description = "AMI ID of the instance"
}

variable "instance_type" {
    description = "Instance type of the EC2 instance"
    type = map(string)

    default = {
      "dev" = "t2.micro"
      "stage" = "t2.medium"
      "prod" = "t2.xlarge"
    }
}

module "ec2-instance" {
    source = "./modules/ec2-instance" 
    ami = var.ami
    instance_type = var.instance_type[terraform.workspace]

}