# Terraform Flux Bootstrap Git Module

This Terraform module creates a Git repository to be used as a source for Flux Bootstrap. Request Google Cloud Cluster credentials to be used for deploying Flux controller to the cluster.

## Dependency

- Installed and preconfigured `gcloud` CLI
- <https://github.com/den-vasyliev/tf-google-gke-cluster>
- <https://github.com/den-vasyliev/tf-hashicorp-tls-keys>

## Usage

```hcl
module "flux_bootstrap" {
  source            = "./modules/fluxcd-gcloud-flux-bootstrap"
  github_repository = "${var.GITHUB_OWNER}/${var.GITHUB_REPOSITORY}"
  private_key       = module.tls_private_key.private_key_pem
  config_path       = module.gke_cluster.kubeconfig
  github_token      = var.GITHUB_TOKEN
  cluster_name      = var.GKE_CLUSTER_NAME
  cluster_region    = var.GOOGLE_REGION
  cluster_project   = var.GOOGLE_PROJECT
}
```

## Inputs

- github_repository - (Required) The name of the Git repository to be created.
- github_token - (Required) The GitHub token used by fluxcd/flux provider
- cluster_name - (Required) The name of the GKE cluster.
- cluster_region - (Required) The region of the GKE cluster.
- cluster_project - (Required) The project of the GKE cluster.
- target_path - (Optional) The path to clone the Git repository into. Default value is clusters.
- private_key - (Optional) The SSH private key to use for Git operations.
- config_path - (Optional) The path to the Kubernetes configuration file. Default value is ~/.kube/config.

## Outputs

None.

License
This module is licensed under the MIT License. See the LICENSE file for details.
