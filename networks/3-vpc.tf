resource "google_compute_network" "vpc_network" {
  name                    = "${var.vpc_network}"
  auto_create_subnetworks = false
  mtu                     = 1460
  routing_mode            = "REGIONAL"
}
