FROM alpine AS builder

RUN apk add --no-cache curl
WORKDIR /build
# Fetch applications
RUN curl -LO https://github.com/omeka/Omeka/releases/download/v2.8/omeka-2.8.zip \
  -O https://github.com/fisharebest/webtrees/releases/download/2.0.16/webtrees-2.0.16.zip
RUN for z in *.zip; do unzip $z; done
RUN rm *.zip
# Move to release folder structure
RUN mv omeka-* /release
RUN mv webtrees /release/
# Bring in additional files
COPY ./omeka /release
COPY ./webtrees /release/webtrees

FROM php:7.4-apache
RUN apt-get update -qq && apt-get install -y \
  libpng-dev libjpeg-dev libfreetype6-dev \
  libicu-dev libzip-dev \
  default-libmysqlclient-dev \
  && rm -r /var/lib/apt/lists/* \
  && docker-php-ext-configure gd --with-freetype --with-jpeg \
  && docker-php-ext-install exif gd mysqli pdo_mysql intl zip \
  && a2enmod rewrite
RUN mv "$PHP_INI_DIR/php.ini-production" "$PHP_INI_DIR/php.ini"
COPY php.ini $PHP_INI_DIR/conf.d/
WORKDIR /var/www/html
COPY --from=builder /release ./
RUN chmod -R a+rw files application/logs/errors.log \
  webtrees/data
