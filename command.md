### Construire une image à partir d'un dockerfile
```bash
docker build -f <path_dockerfile> -t <nom_image> .
```

## Démarrer un conteneur
``` bash
docker run <options> <nom_image> <surcharge_possible_de_la_commande_de_démarrage>
```

## options:
- -d: détaché => un conteneur dans son propre processus
- -p: redireciton des ports du host vers le conteneur
- --name: donner un nom au conteneur
- -it: une connexion tty vers le conteneur

## Une commande pour supprimer
```bash
docker rm <options> <id_ou_conteneur>
```

## options
- -f: pour forcer la suppression d'un conteneur en cours d'execution

## Une commande pour executer une action dans un conteneur

```bash
docker exec <id_ou_nom_conteneur> <commande>
```

## Une commande pour récupérer les informations d'un conteneur.
```bash
docker inspect <nom_conteneur>
```

## Localisation du fichier de conf nginx
- dans /etc/nginx/conf.d/default.conf


## Ajouter des variables env à la création du conteneur.

```bash
docker run -it -e DEMO_ENV="value demo env" ubuntu bash 
```

## Accèder aux logs d'un conteneur

```bash
docker logs <id_ou_nom_conteneur>
```

### Commande docker compose
```bash
docker compose build --no-cache
```

### Commande pour le scaling
docker compose up -d --scale <nom_service>=<nombre_instance>

### Commande kubectl 

- Création d'une ressource
```bash
kubectl apply -f <chemin_vers_fichier>
```

- Récupération des informations sur des ressources
```bash
kubectl get <type_ressource> -n <namespace>
```

-- Commande pour envoyer une image local vers un cluster kind
kind load docker-image <nom_image> --name <nom_cluster>

-- Commande pour créer un proxy entre le client et cluster pour tester le trafic vers une ressource
kubectl port-forward <type_ressource>/<nom_ressource> <port_host>:<port_ressource>