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

So I was hitting this error

```
helm_release.nginx_ingress_controller: rpc error: code = Unknown desc = configmaps is forbidden: User "system:serviceaccount:kube-system:default" cannot list configmaps in the namespace "kube-system"
```

Which I think is because using google cloud means I’m using rolebased access control and I hadn’t realised. So I did this and it just worked lol: https://stackoverflow.com/a/46688254 and it worked just worked ???

My understanding is that this created a service account in helm’s namespace and gave it admin powers. Todo: understand this properly. Here’s something I should read: https://helm.sh/docs/using_helm/#role-based-access-control
