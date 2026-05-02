#!/bin/sh
set -e

cd /var/www/html

echo "date.timezone = ${TZ:-Europe/Berlin}" > /usr/local/etc/php/conf.d/zz-timezone.ini

mkdir -p var/data var/cache var/log
chown -R www-data:www-data var

DB_FILE=var/data/strichliste.db
if [ ! -f "$DB_FILE" ]; then
    echo "[entrypoint] Creating database schema at $DB_FILE"
    php bin/console doctrine:schema:create --no-interaction
fi
if ! php bin/console doctrine:migrations:up-to-date --no-interaction; then
    echo "[entrypoint] Applying migrations"
    php bin/console doctrine:migrations:migrate --no-interaction
    php bin/console cache:clear --no-interaction
fi

chown -R www-data:www-data var

exec "$@"
