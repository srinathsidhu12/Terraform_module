terraform {
  backend "s3" {
    bucket = "terraform-statefile-bucket321"
    region = "ap-south-1"
    key    = "terraform.tfstate"
    use_lockfile = true
  }
}
