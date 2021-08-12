#!/bin/bash

kubectl create namespace elc
kubectl apply -n elc -f ./010-crds.yaml
kubectl apply -n elc -f ./020-operator.yaml
kubectl apply -n elc -f ./030-es-cluster.yaml
kubectl apply -n elc -f ./040-kibana.yaml

PASSWORD=$(kubectl get secret es-cluster-es-elastic-user -o go-template='{{.data.elastic | base64decode}}')



