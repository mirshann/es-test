#!/bin/bash

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts

helm install alertmanager prometheus-community/alertmanager
helm install kube-prom-stack prometheus-community/kube-prometheus-stack
helm install kube-state-metrics prometheus-community/kube-state-metrics
helm install prom prometheus-community/prometheus
helm install prom-els-exporter prometheus-community/prometheus-elasticsearch-exporter
helm install graf grafana/grafana