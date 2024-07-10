resource "google_compute_subnetwork" "vpc_subnet" {
  name            = "${var.vpc_subnet}"
  region          = var.region
  network         = google_compute_network.vpc_network.id
  ip_cidr_range   = var.ip_range
}

resource "google_compute_subnetwork" "vpc_subnet_private" {
  name            = "${var.vpc_subnet_private}"
  region          = var.region
  network         = google_compute_network.vpc_network.id
  ip_cidr_range   = var.ip_range_private
}