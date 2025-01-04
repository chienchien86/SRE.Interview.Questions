// Assume the nginx ingress controller has been install 
resource "kubernetes_ingress_v1" "mysql_ingress" {
  metadata {
    name      = "mysql-ingress"
    namespace = "aisayo"
    annotations = {
      "nginx.ingress.kubernetes.io/rewrite-target" = "/"
    }
  }

  spec {
    ingress_class_name = "nginx"
    rule {
      host = "aisayo.com"
      http {
        path {
          path = "/"
          backend {
            service {
              name = "mysql"
              port {
                number = 3306
              }
            }
          }
        }
      }
    }
  }

  depends_on = [
    helm_release.mysql
  ]
}
