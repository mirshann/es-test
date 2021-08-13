# Elsticksearch deployment process

1. deploying of cluster on google cloud - README.md in ./cloud-deployment
2. deploying of Elasticsearch with helm-charts - README.md in ./es-cloud-helm
3. deploying of Elasticsearch with elasticksearch-operator - README.md in ./es-cloud-operator
4. deploying of cluster monitoring with prometheus/graphana - README.md in ./monitoring


# Questions


## Why deploy the cluster in a specific way, what is your rationale? Be prepared to justify and explain deployment configuration options.

All steps of cluster deployment based on infrastructure is a code paradigm. Main reason for this way is to reduce risks that manual hand configuration brings to environment. Additional plus for this paradigm that it's highly automatible so you can basicale run it throug CI/CD piplines with all necessary testing and staging steps as common code. In this task I choose to use two ways of deployment Elasticsearch. One with Elasticsearch operator, that looks like more kubernetes config native way. And second is Helm chart deployment. Both ways are Infrastructure as a code but can be more agile for different types of infrastructure management styles. Helm in this case is more usefull whan you have dependencies on 3rd party maintained solution, so it works like packet manager in our kubernetes infrastructure.

## Which metrics to look out for and why?

### Elasticsearch

- free disk space for data volumes (To avoide data loss if disk will be overflown)
- load averege (To avoid service interruption or timeout issues)
- indexes statuses (Elastickserch good in full text search, bracke of indexes get's it not much usefull)
- replication lag (Growing lag indicates a throughput issue that can cause loss of data in case of node/disk problem)

### Kubernetes cluster

- node status (to catch any issues with nodes)
- nodes load averege (To avoid service interruption or timeout issues)
- amount of pending and/or failed deployments (can be issued by antiaffinity rules or CPU/MEMORy requirements for specific deployments)

## What would the deploy, debug, backup, update/roll-back, maintenance processes be?

### Deploy

Initial deployment may be executed from local machine with deployment scrypts or modified to run through terraform plugins to set up full process from one Infrastructure as a Code engine. Better way is to build CI/CD pipelines with testing stages and VCS branching, to avoid manual exectution and better repeatability of process.

### Debug

There is alot of abstraction levels for debug this deployment. Starting from the real low level conteiner debug on node, for which you need to get access to real node vm. On kubernetes level usefull commands may be 'kubectl get logs', 'kubectl describe <object>' or using Kubernetes Dashboard as a friendly UI for Kubernetes cluster. Cluster on other side used for this deployment is a GKE service, and main way to debug it will be contact to GCP support with ticketing system.

### Backup
Here we need to split two parameters:
1. Infrastructure as a Code commonly provides relible way to roll out infrastructure from VCS, so you always awailable to roll back on working commit. Additionaly GKE have it's own cluster backup [procedure](https://cloud.google.com/anthos/clusters/docs/on-prem/1.4/how-to/backing-up)
2. Data backaup for common Cloud persistant volumes are based on imaging disks. 


### Update/roll-back

There is multiply ways that can be implemented in kubernetes environment. Rolling updates for deployment will replace pods one by one and will not start next pod deleteon before new pod is in health state. It can be part of "Canary deployment when you have limited ammount replaced containers with a newer version. Rollback is a comon procedure for both kubctl or helm managed infrastructure. In kubernetes you can rollback even to the specific version of deployment in the past. Persistent volume claims allowes you to mount data directly from replaced to replacing pods.

### Maintenance

Constatnt monitoring with right alerting configured allows you to reduce downtime for service. Kubernetes cluster maintainance may be a more trickey procedures. It's alwayes a deal between possibility to use Blue Green deployment or hot swap mirror for full cluster or to reduce costs and rely on service (GKE/EKS/AKS) relibility.