FROM php:8.5-fpm

ARG VERSION
ENV STRICHLISTE_VERSION=${VERSION} \
    APP_ENV=prod \
    APP_DEBUG=0

RUN apt-get update && apt-get install -y --no-install-recommends \
      libicu-dev \
      libzip-dev \
      libsqlite3-dev \
      libfcgi-bin \
      ca-certificates \
    && docker-php-ext-install -j"$(nproc)" pdo_sqlite intl zip \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /var/www/html

ADD https://github.com/strichliste/strichliste-backend/releases/download/v${VERSION}/strichliste-backend-v${VERSION}.tar.gz /tmp/src.tar.gz
RUN tar -xzf /tmp/src.tar.gz -C /var/www/html \
 && rm /tmp/src.tar.gz \
 && mkdir -p var/data var/cache var/log \
 && chown -R www-data:www-data var

COPY fpm-overrides.conf /usr/local/etc/php-fpm.d/zz-overrides.conf

COPY entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

EXPOSE 9000

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["php-fpm"]
