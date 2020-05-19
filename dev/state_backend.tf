terraform {
  backend "s3" {
    bucket = "devstatebackendterraform"
    key    = "awsdevremotestatefile"
    region = "us-east-1"
    profile = "terraformstate"
  }
}
