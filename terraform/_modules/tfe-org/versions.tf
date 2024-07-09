terraform {
  required_version = "~> 1.3.7"

  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = "~> 0.42.0"
    }
  }
}
