################################################################################
# Provider config
################################################################################
provider "kubernetes" {
  # Assuming that your K8s cluster is already set up, use kubeconfig to authenticate
  config_path    = "~/.kube/config" # or the path to your kubeconfig file
  config_context = "XXX" #"your cluster name"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config" # Kubernetes config path
  }
}