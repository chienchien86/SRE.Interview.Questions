resource "helm_release" "mysql" {
  name       = "mysql"
  chart      = "mysql"                                    # Specify the chart name here
  repository = "oci://registry-1.docker.io/bitnamicharts" # Chart repository URL
  namespace  = "aisayo"                                   # Kubernetes namespace where you want to install MySQL

  values = [
    file("mysql-values.yaml")
  ]

  depends_on = [
    kubernetes_namespace.aisayo
  ]
}
