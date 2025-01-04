resource "kubernetes_namespace" "aisayo" {
  metadata {
    name = "aisayo"
  }
}