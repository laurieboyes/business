# Business

My playground for getting my head around kubernetes, terraform and helm

## Prerequisites to install on dev machine

- gcloud cli
- terraform
- helm

## Create the cluster

```
terraform init
terraform plan
terraform apply
```

## Get authenticated with GCP for local dev/deploy

Create a service account for doing terraform stuff with Project Editor role
Create file `./creds/serviceaccount.json` with service account key downloaded from cloud dashboard

```
gcloud auth login
gcloud container clusters get-credentials super-cool-cluster --zone europe-west1-b --project business-238908
```

## Set up other stuff for deployment
helm init --history-max 200
```



# BRB shiiiiiet

```
1 error(s) occurred:

* helm_release.nginx_ingress_controller: 1 error(s) occurred:

* helm_release.nginx_ingress_controller: error installing: Post https://34.76.135.48/apis/extensions/v1beta1/namespaces/kube-system/deployments: dial tcp 34.76.135.48:443: i/o timeout

Terraform does not automatically rollback in the face of errors.
Instead, your Terraform state file has been partially updated with
any resources that successfully completed. Please address the error
above and apply again to incrementally change your infrastructure.

```
