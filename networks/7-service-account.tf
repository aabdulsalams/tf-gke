resource "google_service_account" "gke_service_account" {
  account_id   = "poc-gke-service-account"
  display_name = "GKE Service Account"
}

resource "google_service_account_key" "gke_service_account_key" {
  service_account_id = google_service_account.gke_service_account.name
}

resource "google_project_iam_member" "gke_sa_role" {
  project = var.project
  role    = "roles/container.developer"
  member  = "serviceAccount:${google_service_account.gke_service_account.email}"
}

resource "local_file" "sa_key" {
  content  = base64decode(google_service_account_key.gke_service_account_key.private_key)
  filename = "${path.module}/poc-gke-service-account.json"
}

output "gke_service_account_key" {
  value = google_service_account_key.gke_service_account_key.private_key
  sensitive = true
}

resource "google_service_account" "gke_service_account_viewer" {
  account_id   = "poc-gke-viewer-service-account"
  display_name = "GKE Service Account"
}

resource "google_service_account_key" "gke_service_account_key_viewer" {
  service_account_id = google_service_account.gke_service_account_viewer.name
}

resource "google_project_iam_member" "gke_sa_role_viewer" {
  project = var.project
  role    = "roles/container.clusterViewer"
  member  = "serviceAccount:${google_service_account.gke_service_account_viewer.email}"
}

resource "local_file" "sa_key_viewer" {
  content  = base64decode(google_service_account_key.gke_service_account_key_viewer.private_key)
  filename = "${path.module}/poc-gke-service-account-viewer.json"
}

output "gke_service_account_key_viewer" {
  value = google_service_account_key.gke_service_account_key_viewer.private_key
  sensitive = true
}

