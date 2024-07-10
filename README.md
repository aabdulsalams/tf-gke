# Terraform GKE Setup
This repo contains:
1. Terraform script to create Kubernetes cluster on GCP
2. Simple application manifest

### Prerequisite
1. GCP Account: https://cloud.google.com/
2. Terraform installed: https://developer.hashicorp.com/terraform/install?product_intent=terraform
3. GCloud CLI installed: https://cloud.google.com/sdk/docs/install
4. Helm Installed: https://helm.sh/

### Steps

##### Setup Infrastructure
1. Inside 'networks' directory create terraform.tfvars file, you can copy it from terraform.tfvars.example
2. Inside 'networks' directory run these command:
- `terraform init` 
- `terrafrom plan`
- `terraform apply`
or you can run it with command `bash setup.sh` instead

3. Inside 'kubernetes' directory create terraform.tfvars file, you can copy it from terraform.tfvars.example
4. Inside 'kubernetes' directory run these command:
- `terraform init` 
- `terrafrom plan`
- `terraform apply`
or you can run it with command `bash setup.sh` instead

##### Install Sample Application
1. Access k8s cluster by run this command:
- `gcloud auth activate-service-account --key-file=xxxxxx.json` 

2. Inside 'applications/simple-app' directory run these command:
- `kubectl apply -f deployment.yaml`
- `kubectl apply -f service.yaml`
- `kubectl apply -f rbac.yaml`
- `kubectl apply -f ingress.yaml`
or you can run it with command `bash setup.sh` instead

3. Inside 'applications/canary-app' directory run these command:
`cd helm-canary/templates`
`kubectl apply -f deployment.yaml`
`kubectl apply -f service.yaml`
or you can run it with command bash setup.sh instead

#### Sources:
1. https://registry.terraform.io/providers/hashicorp/google/latest
2. https://paulhopkins11.github.io/helm-canary