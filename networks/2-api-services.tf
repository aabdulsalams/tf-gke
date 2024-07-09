resource "google_project_service" "api_gke_api" {
  service = "container.googleapis.com"
}

resource "google_project_service" "crm_api" {
  service = "cloudresourcemanager.googleapis.com"
}