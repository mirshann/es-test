### Deployment of Elasticksearch with Helm

## Requirements:

1. Deployed Kubernetes cluster and configured kubectl
2. Installed Helm

## Parameters of deployment:

All deployment parameters that owerrides default [parameters|https://github.com/elastic/helm-charts/tree/master/elasticsearch] alloceted in values.yaml

## Deployment

    run deploy.sh

## Rollback

run helm rollback elasticksearch-test

## Useful links

- [Elasticksearch helm repo](https://github.com/elastic/helm-charts/tree/master/elasticsearch)

- [Defaul values.yaml for helm](https://github.com/elastic/helm-charts/blob/master/elasticsearch/values.yaml)

- [Elastic Kibana helm repo](https://github.com/elastic/helm-charts/tree/master/kibana)