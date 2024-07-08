## Build app
docker build -f Dockerfile.app -t image-app-slide-17 .

## Build nginx
docker build -f Dockerfile.nginx -t image-nginx-slide-17 .

## Network bridge
docker network create --driver bridge bridge-slide-17

## Container creation
docker run -d --network bridge-slide-17 --name php image-app-slide-17
docker run -d --network bridge-slide-17 -p 9000:80 image-nginx-slide-17
