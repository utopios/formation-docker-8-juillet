FROM ubuntu

RUN apt update 
RUN apt install nginx -y

COPY ./index.html /var/www/html

## Commande pour créer un dossier dans un conteneur et naviguer jusqu'au dossier
# WORKDIR /app
# COPY . /app
EXPOSE 80




CMD ["nginx", "-g", "daemon off;"]
#ENTRYPOINT ["nginx", "-g", "daemon off;"]
