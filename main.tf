provider "flux" {
  kubernetes = {
    config_path = var.config_path
    exec = {
      api_version = "client.authentication.k8s.io/v1beta1"
      args = ["container", "clusters", "get-credentials", var.cluster_name, "--zone", var.cluster_region, "--project", var.cluster_project]
      command = "gcloud"
    }
  }
  git = {
    url = "https://github.com/${var.github_repository}.git"
    http = {
      username = "git"
      password = var.github_token
    }
  }
}

resource "flux_bootstrap_git" "this" {
  path = var.target_path
}
