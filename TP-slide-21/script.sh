docker build -f Dockerfile.app -t image-app-slide-17 .

## Build nginx
docker build -f Dockerfile.nginx -t image-nginx-slide-17 .


### Création de volume
docker volume create data-postgres

### Création d'un réseau
docker network create --driver bridge bridge-slide-21

###
docker run -d --name postgres --network bridge-slide-21 -e POSTGRES_PASSWORD="ChangeMe" -e POSTGRES_USER="symfony" -e POSTGRES_DB="app" -v data-postgres:/var/lib/postgresql/data postgres

docker run -d --network bridge-slide-21 -e  DATABASE_URL="postgresql://symfony:ChangeMe@postgres:5432/app" --name php image-app-slide-17
docker run -d --network bridge-slide-21 -p 9000:80 image-nginx-slide-17
