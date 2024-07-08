FROM ubuntu

LABEL author="Ihab ABADI"
LABEL description="simple demo dockerfile"

RUN apt update 
RUN apt install nginx -y

RUN useradd -ms /bin/bash admin

COPY --chown=admin:admin ./index.html /var/www/html

## Commande pour créer un dossier dans un conteneur et naviguer jusqu'au dossier
# WORKDIR /app
# COPY . /app
EXPOSE 80

ENV DEMO_ENV=value_env
ARG DEMO_ARG=value_arg
RUN echo ${DEMO_ENV}

USER admin

CMD ["nginx", "-g", "daemon off;"]
#ENTRYPOINT ["nginx", "-g", "daemon off;"]
