provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "sandhya" {
    ami             = "ami-0c7217cdde317cfec"
    instance_type   = "t2.micro"
}

resource "aws_s3_bucket" "s3_bucket" {
    bucket = "backend-bucket-for-terraform-statefile"
}

resource "aws_dynamodb_table" "terraform_lock" {
    name = "terraform_lock"
    billing_mode = "PAY_PER_REQUEST"
    hash_key = "LockID"

    attribute {
      name = "LockID"
      type = "S"
    }
}