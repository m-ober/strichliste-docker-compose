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
php bin/console doctrine:migrations:migrate --no-interaction --allow-no-migration
php bin/console cache:clear --no-interaction

chown -R www-data:www-data var

exec "$@"
