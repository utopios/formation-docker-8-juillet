## Stage build
FROM php:8.1-cli as builder

RUN apt update && apt install -y zip unzip git libpq-dev && docker-php-ext-install pdo pdo_pgsql

RUN useradd -md /bin/bash admin

RUN git clone https://github.com/NouvelleTechno/e-commerce-Symfony-6.git /app

WORKDIR /app

RUN chown -R admin:admin /app

RUN chmod 755 /app


RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

USER admin

RUN composer install

## Stage run

FROM php:8.1-apache

WORKDIR /var/www/html/

RUN apt update && apt install iputils-ping libpq-dev -y && docker-php-ext-install pdo pdo_pgsql

RUN useradd -md /bin/bash admin

COPY --from=builder --chown=admin:admin /app/ /var/www/html/

ENV APACHE_DOCUMENT_ROOT=/var/www/html/public

RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/sites-enabled/*-default.conf
RUN sed -ri -e 's!/var/www/html!${APACHE_DOCUMENT_ROOT}!g' /etc/apache2/conf-available/*.conf /etc/apache2/apache2.conf

RUN a2enmod rewrite


WORKDIR /var/www/html

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh

RUN chmod +x /usr/local/bin/docker-entrypoint.sh

USER admin

ENTRYPOINT [ "docker-entrypoint.sh" ]

#CMD ["apache2-foreground"]