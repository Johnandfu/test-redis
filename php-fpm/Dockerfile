#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "apply-templates.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

#FROM php:8.0.1-fpm-alpine3.12
FROM php:7.3-fpm-alpine3.12
WORKDIR /var/www/
ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/


RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \ 
    chmod +x /usr/local/bin/install-php-extensions && \
    apk upgrade --update \
    && apk add --no-cache --virtual .build-deps\
    && apk --no-cache add composer autoconf gcc g++ make ffmpeg graphicsmagick zip zlib-dev libjpeg-turbo-dev libpng-dev freetype-dev imagemagick-dev libzip-dev libwebp-dev rabbitmq-c rabbitmq-c-dev  librdkafka-dev icu icu-dev icu-libs \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/ \
    # && docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-webp \ 
    && docker-php-ext-install gd \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-enable pdo_mysql \
    && docker-php-ext-install exif mysqli pdo_mysql zip sockets intl  bcmath \
    && install-php-extensions imagick intl \
    && pecl install rdkafka \
    && docker-php-ext-enable rdkafka \
    && install-php-extensions amqp mongodb \
    && docker-php-ext-enable amqp mongodb \
    && pecl install redis \
    && docker-php-ext-enable redis\
    && apk del .build-deps \
    && apk update \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/pear 
EXPOSE 9000 9998
CMD ["php-fpm"]