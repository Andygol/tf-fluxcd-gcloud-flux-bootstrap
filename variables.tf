variable "github_repository" {
  type        = string
  description = "GitHub repository to store Flux manifests"
}

variable "target_path" {
  type        = string
  default     = "clusters"
  description = "Flux manifests subdirectory"
}

variable "github_token" {
  type        = string
  default     = ""
  description = "The token used to authenticate with the Git repository"
}

variable "private_key" {
  type        = string
  description = "The private key used to authenticate with the Git repository"
}

variable "config_path" {
  type        = string
  default     = "~/.kube/config"
  description = "The path to the kubeconfig file"
}

variable "cluster_name" {
  type = string
  description = "The name of the cluster"
}

variable "cluster_region" {
  type = string
  description = "The region of the cluster"
}

variable "cluster_project" {
  type = string
  description = "The project of the cluster"
}

