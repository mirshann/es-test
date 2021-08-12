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

5. check out dashboard:

    kubectl proxy

then access [Kubernetes Dashboard](http://127.0.0.1:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/)
