#!/bin/bash

kubectl create namespace elc
helm repo add elastic https://helm.elastic.co
helm install elasticsearch elastic/elasticsearch -n elc -f ./values.yaml
helm install kibana elastic/kibana -n elc
