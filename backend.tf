terraform {
  backend "s3" {
    bucket = "mybucket"
    key    = "${var.environment}/terraform.tfstate"
    region = "ap-south-1"
    use_lockfile = true
  }
}
