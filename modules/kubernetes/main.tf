resource "google_container_cluster" "gke-cluster" {
  name               = "super-cool-cluster"
  network            = "default"
  zone               = "europe-west1-b"
  initial_node_count = 3
}

output "client_certificate" {
  value = "${base64decode(google_container_cluster.gke-cluster.master_auth.0.client_certificate)}"
}

output "client_key" {
  value = "${base64decode(google_container_cluster.gke-cluster.master_auth.0.client_key)}"
}

output "cluster_ca_certificate" {
  value = "${base64decode(google_container_cluster.gke-cluster.master_auth.0.cluster_ca_certificate)}"
}

output "host" {
  value = "${google_container_cluster.gke-cluster.endpoint}"
}
