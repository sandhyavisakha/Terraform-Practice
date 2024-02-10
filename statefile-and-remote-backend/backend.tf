terraform {
  backend "s3" {
    bucket = "backend-bucket-for-terraform-statefile"
    region = "us-east-1"
    key = "sandhya/terraform.tfstate"
    dynamodb_table = "terraform_lock"
  }
}