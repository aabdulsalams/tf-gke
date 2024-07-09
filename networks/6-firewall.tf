resource "google_compute_firewall" "allow_internal" {
  name          = "allow-internal"
  network       = google_compute_network.vpc_network.name
  direction     = "INGRESS"

  allow {
    protocol    = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }

  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }

  priority = 65534

  source_ranges = ["${var.ip_range}"]
}

resource "google_compute_firewall" "allow_ssh" {
  name          = "allow-ssh"
  network       = google_compute_network.vpc_network.name
  direction     = "INGRESS"

  allow {
    protocol    = "TCP"
    ports       = ["22"]
  }

  priority = 65534

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow_http" {
  name          = "allow-http"
  network       = google_compute_network.vpc_network.name
  direction     = "INGRESS"

  allow {
    protocol    = "TCP"
    ports       = ["80"]
  }

  priority = 65534

  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "allow_https" {
  name          = "allow-https"
  network       = google_compute_network.vpc_network.name
  direction     = "INGRESS"

  allow {
    protocol    = "TCP"
    ports       = ["443"]
  }

  priority = 65534

  source_ranges = ["0.0.0.0/0"]
}