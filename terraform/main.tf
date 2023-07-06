terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.72.0"
    }
  }
}

provider "google" {
  credentials = file("safechat-391919-d9dab6b87e49.json")

  project = "safechat-391919"
  region  = "us-east1"
  zone    = "us-east1-b"
}

resource "google_compute_network" "vpc_network" {
  name = "safechat-network"
}

module "object_storage" {
  source = "./modules/object_storage"
}