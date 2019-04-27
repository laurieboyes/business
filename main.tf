provider "google" {
  credentials = "${file("./creds/serviceaccount.json")}"
  project     = "business-238908"
  region      = "europe-west1"
}

module "kubernetes" {
  source = "./modules/kubernetes"
}
