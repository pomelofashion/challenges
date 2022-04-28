terraform {
  backend "s3" {
    bucket = "glefevretfstate"
    key    = "tfstate/pomelo"
    region = "ap-southeast-1"
  }
}