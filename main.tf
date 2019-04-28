provider "google" {
  credentials = "${file("./creds/serviceaccount.json")}"
  project     = "business-238908"
  region      = "europe-west1"
}

resource "google_container_cluster" "gke-cluster" {
  name               = "super-cool-cluster"
  network            = "default"
  zone               = "europe-west1-b"
  initial_node_count = 2
}

provider "kubernetes" {
  # Leave empty to use credentials configured for kubectl
}

resource "helm_release" "nginx_ingress_controller" {
  name  = "nginx-ingress"
  chart = "stable/nginx-ingress"

  set {
    name  = "controller.replicaCount"
    value = 1
  }

  values = [
    "${file("./resources/nginx-values.yaml")}",
  ]
}
