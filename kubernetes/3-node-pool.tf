resource "google_service_account" "kubernetes_account" {
  account_id    = "${google_container_cluster.init_node.name}"
  display_name  = "${google_container_cluster.init_node.name} service account"
}

resource "google_project_iam_member" "gke_role_artifact_registry" {
  project = var.project
  for_each = toset([
    "roles/artifactregistry.reader",
  ])
  role = each.key
  member = "serviceAccount:${google_service_account.kubernetes_account.email}"
}

resource "google_container_node_pool" "gke_node" {
  name        = var.gke_node_pool_name
  location    = var.region
  cluster     = google_container_cluster.init_node.id
  node_count  = 1

  management {
    auto_repair   = true
    auto_upgrade   = true
  }

  node_config {
    preemptible   = false
    machine_type  = var.gke_machine_type
    disk_size_gb = 30
    disk_type = var.gke_disk_type

    labels = {
      project = var.project
      env = var.gke_environment
      preemptible = "false"
    }

    service_account = google_service_account.kubernetes_account.email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
  }
}
