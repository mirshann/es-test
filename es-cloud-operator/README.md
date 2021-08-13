# Deploying Elasticksearch-cloud with operator management

## Requirements

1. kubectl configured to work with cluster

## Deployment

    run ./deploy.sh

Get the password for Elasticsearch and check log:

    PASSWORD=$(kubectl get secret es-cluster-es-elastic-user -o go-template='{{.data.elastic | base64decode}}')
    kubectl port-forward service/es-cluster-es-http 9200
    curl -u "elastic:$PASSWORD" -k "https://localhost:9200"

Get access to Kibana:

    kubectl port-forward service/quickstart-kb-http 5601

default user: elastic
password can be retrieved by:

    kubectl get secret quickstart-es-elastic-user -o=jsonpath='{.data.elastic}' | base64 --decode; echo

## Usefull links:

- [Elastic Cloud documentation](https://www.elastic.co/guide/en/cloud-on-k8s/1.7/index.html)
