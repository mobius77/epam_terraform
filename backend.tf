terraform {
  backend "s3" {
    bucket = "terraform-state-bucket-epam"
    key = "main"
    region = "eu-central-1"
    dynamodb_table = "terraform-table"
  }
}