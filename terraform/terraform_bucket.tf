/***********************************************
  GCS Bucket - Terraform State
 ***********************************************/

locals {
  state_bucket_name = format("%s-%s-%s", "eslo-projects", "tfstate", random_id.suffix.hex)
}

resource "random_id" "suffix" {
  byte_length = 2
}

resource "google_storage_bucket" "org_projects_terraform_state" {
  project                     = var.iac_project_id
  name                        = local.state_bucket_name
  location                    = var.region
  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }
}
