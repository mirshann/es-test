### Deployment of GKE service in GCP

## Requiriments 

1. GCP Account
2. installed gcloud SDK
3. installed and configured with gcloud SDK kubectl
4. installed terraform

## Deployment

1. check deployment name variable in prod.tfvars
2. initialize terraform with:

    terraform init

3. check cluster parameters in gcp.tf (for propper deployment of all elasticksearch pods on separate nodes we need at least 3 node cluster)
4. deploy Kubernetes dashboard with 

    kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta8/aio/deploy/recommended.yaml

5. get a proxy to kubernetes cluster:

    kubectl proxy

6. Check out [Kubernetes Dashboard](http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/)


## Useful links

- [Terraform and GKE](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/using_gke_with_terraform)

- [Provision of GKE with Terraform](https://learn.hashicorp.com/tutorials/terraform/gke?in=terraform/kubernetes&utm_source=WEBSITE&utm_medium=WEB_IO&utm_offer=ARTICLE_PAGE&utm_content=DOCS&_ga=2.125830669.1866906916.1628797633-1420043610.1627863839)