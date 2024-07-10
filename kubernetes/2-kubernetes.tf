data "google_compute_network" "vpc_network" {
  name = "${var.vpc_network}"
}

data "google_compute_subnetwork" "vpc_subnet" {
  name = "${var.vpc_subnet}"
}

resource "google_container_cluster" "init_node" {
  name                     = "${var.project}-gke"
  location                 = var.region
  network                  = data.google_compute_network.vpc_network.id
  subnetwork               = data.google_compute_subnetwork.vpc_subnet.id

  resource_labels = {
    project = var.project
  }

  node_locations = var.gke_node_locations

  remove_default_node_pool = true
  initial_node_count       = 1
  deletion_protection      = false
  logging_service          = "none"
  monitoring_service       = "none"

  network_policy {
    enabled = true
  }

  ip_allocation_policy {
    cluster_ipv4_cidr_block = var.gke_cluster_ip_range
    services_ipv4_cidr_block  = var.gke_services_ip_range
  }

  addons_config {
    http_load_balancing {
      disabled = false
    }
    horizontal_pod_autoscaling {
      disabled = false
    }
  }
}
