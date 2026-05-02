FROM nginx:alpine

ARG VERSION
ENV STRICHLISTE_VERSION=${VERSION}

ADD https://github.com/strichliste/strichliste-web-frontend/releases/download/v${VERSION}/strichliste-web-frontend.tar.gz /tmp/src.tar.gz
RUN tar -xzf /tmp/src.tar.gz --strip-components=1 -C /usr/share/nginx/html \
 && rm /tmp/src.tar.gz

COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
