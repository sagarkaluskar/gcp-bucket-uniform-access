terraform {
  required_version = ">= 1.3.0"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0"
    }
  }
}

provider "google" {
  project = var.project_id
  region  = var.gcp_region
}

resource "google_storage_bucket" "this" {
  name                        = "${var.name_prefix}-${var.project_id}"
  location                    = var.gcp_region
  force_destroy               = true
  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}
