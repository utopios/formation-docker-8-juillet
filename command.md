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
