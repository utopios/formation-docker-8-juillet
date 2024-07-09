#! /bin/bash

php bin/console make:migration
php bin/console doctrine:migrations:migrate --no-interaction
apache2-foreground