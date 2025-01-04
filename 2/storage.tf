# Primary Persistent Volume for MySQL Monitoring
resource "kubernetes_persistent_volume" "mysql_monitoring_primary" {
  metadata {
    name   = "mysql-monitoring-primary"
    labels = {
      app = "mysql-monitoring-primary"
    }
  }

  spec {
    capacity {
      storage = "10Gi"
    }

    host_path {
      path = "/data/mysql-monitoring-primary"
    }

    access_modes = ["ReadWriteOnce"]

    node_affinity {
      required {
        node_selector_terms {
          match_expressions {
            key      = "kubernetes.io/hostname"
            operator = "In"
            values   = [""]
          }
        }
      }
    }
  }
}

# Secondary Persistent Volume for MySQL Monitoring
resource "kubernetes_persistent_volume" "mysql_monitoring_secondary" {
  metadata {
    name   = "mysql-monitoring-secondary"
    labels = {
      app = "mysql-monitoring-secondary"
    }
  }

  spec {
    capacity {
      storage = "10Gi"
    }

    host_path {
      path = "/data/mysql-monitoring-secondary"
    }

    access_modes = ["ReadWriteOnce"]

    node_affinity {
      required {
        node_selector_terms {
          match_expressions {
            key      = "kubernetes.io/hostname"
            operator = "In"
            values   = [""]
          }
        }
      }
    }
  }
}

# Persistent Volume Claim for Primary MySQL Monitoring
resource "kubernetes_persistent_volume_claim" "mysql_monitoring_primary" {
  metadata {
    name      = "mysql-monitoring-primary"
    namespace = "monitoring"
  }

  spec {
    access_modes = ["ReadWriteOnce"]

    resources {
      requests = {
        storage = "10Gi"
      }
    }

    selector {
      match_labels = {
        app = "mysql-monitoring-primary"
      }
    }

    storage_class_name = ""
  }
}

# Persistent Volume Claim for Secondary MySQL Monitoring
resource "kubernetes_persistent_volume_claim" "mysql_monitoring_secondary" {
  metadata {
    name      = "mysql-monitoring-secondary"
    namespace = "monitoring"
  }

  spec {
    access_modes = ["ReadWriteOnce"]

    resources {
      requests = {
        storage = "10Gi"
      }
    }

    selector {
      match_labels = {
        app = "mysql-monitoring-secondary"
      }
    }

    storage_class_name = ""
  }
}
