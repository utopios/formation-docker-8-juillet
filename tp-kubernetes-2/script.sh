#### Etape 1 => Création d'un cluster kind avec le bon mappage des ports.
kind create cluster --name tp-monitoring --config ressources/kind/config.yml

### Etape 2 => Création d'un namespace
kubectl create -f ressources/k8s/namespace.yml

### Etape 3 => création des serviceAccount, role et roleBinding
kubectl create -f ressources/k8s/fluentd/rbac.yml

### Etape 4 => Création du volume
kubectl create -f ressources/k8s/elasticsearch/ressources-volume.yml

### Etape 5 => Création des services
kubectl create -f ressources/k8s/elasticsearch/services.yml
kubectl create -f ressources/k8s/kibana/services.yml
kubectl create -f ressources/k8s/mysql/services.yml
kubectl create -f ressources/k8s/postgres/services.yml


### Etape 6 => Création des network-policies
kubectl create -f ressources/k8s/elasticsearch/network-policy.yml

### Etape 7  => Création des deployments
kubectl create -f ressources/k8s/fluentd/daemonset.yml
kubectl create -f ressources/k8s/elasticsearch/statefulset.yml
kubectl create -f ressources/k8s/kibana/deployment.yml