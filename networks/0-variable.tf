variable "credentials_file" {
  description = "GCP Project Credential"
}

variable "project" {
  description = "GCP Project Name"
}

variable "region" {
  description = "Region for GCP manifest"
}

variable "vpc_network" {
  description = "VPC network"
}

variable "vpc_subnet" {
  description = "Subnet for VPC"
}

variable "ip_range" {
  description = "IP Range for VPC"
}

variable "vpc_subnet_private" {
  description = "Subnet for VPC Private"
}

variable "ip_range_private" {
  description = "IP Range for VPC Private"
}

variable "vpc_subnet_jkt" {
  description = "Subnet for VPC Jakarta"
}

variable "ip_range_jkt" {
  description = "IP Range for VPC Jakarta"
}

variable "vpc_subnet_private_jkt" {
  description = "Subnet for VPC Private Jakarta"
}

variable "ip_range_private_jkt" {
  description = "IP Range for VPC Private Jakarta"
}

variable "kubernetes_svc_id" {
  description = "Kubernetes Service Account ID"
}