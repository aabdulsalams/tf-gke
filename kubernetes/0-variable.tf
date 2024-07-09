variable "credentials_file" {
  description = "GCP Project Credential"
}

variable "project" {
  description = "GCP Project Name"
}

variable "region" {
  description = "Region for GCP manifest"
}

variable "zone" {
  description = "Zone for GCP manifest"
}

variable "vpc_network" {
  description = "VPC Network"
}

variable "vpc_subnet" {
  description = "Subnet for VPC"
}

variable "gke_node_pool_name" {
  description = "Node Pool Name for GKE"
}

variable "gke_machine_type" {
  description = "Machine Type for GKE"
}

variable "gke_disk_type" {
  description = "Disk Type for GKE"
}

variable "gke_cluster_ip_range" {
  description = "Cluster IP Range for GKE"
}

variable "gke_services_ip_range" {
  description = "Services IP Range for GKE"
}

variable "gke_environment" {
  description = "ENV for GKE"
}
