/**
 * Copyright 2020 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

resource "google_storage_bucket_iam_member" "eslo_platform_non_production" {
  bucket = google_storage_bucket.org_projects_terraform_state.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:822911714916@cloudbuild.gserviceaccount.com"

  # condition {
  #   title       = "Project state"
  #   description = "Allow access only to project state"
  #   expression  = "resource.name.startsWith(\"non-production/prj-e2c-n-platform-ee5b/\")"
  # }
}

resource "google_storage_bucket_iam_member" "eslo_platform_production" {
  bucket = google_storage_bucket.org_projects_terraform_state.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:1031330240347@cloudbuild.gserviceaccount.com"

  # condition {
  #   title       = "Project state"
  #   description = "Allow access only to project state"
  #   expression  = "resource.name.startsWith(\"non-production/prj-e2c-n-platform-ee5b/\")"
  # }
}

resource "google_storage_bucket_iam_member" "org_tf_sa" {
  bucket = google_storage_bucket.org_projects_terraform_state.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:org-terraform@eslo-seed-4117.iam.gserviceaccount.com"
}

resource "google_storage_bucket_iam_member" "org_admin" {
  bucket = google_storage_bucket.org_projects_terraform_state.name
  role   = "roles/storage.admin"
  member = "group:gcp.org-admins@eslo.com.br"
}
