FROM alpine AS builder

RUN apk add --no-cache curl
WORKDIR /build
# Fetch applications
RUN curl -LO https://github.com/omeka/Omeka/releases/download/v2.7.1/omeka-2.7.1.zip \
  -O https://github.com/fisharebest/webtrees/releases/download/1.7.16/webtrees-1.7.16.zip
RUN for z in *.zip; do unzip $z; done
RUN rm *.zip
# Move to release folder structure
RUN mv omeka-* /release
RUN mv webtrees /release/
# Bring in additional files
COPY ./omeka /release
COPY ./webtrees /release/webtrees

FROM php:7.2-apache
RUN apt-get update -qq && apt-get install -y \
  libpng-dev libjpeg-dev libfreetype6-dev \
  imagemagick \
  default-libmysqlclient-dev \
  && rm -r /var/lib/apt/lists/* \
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include --with-jpeg-dir=/usr/include \
  && docker-php-ext-install exif gd mysqli pdo_mysql \
  && a2enmod rewrite
WORKDIR /var/www/html
COPY --from=builder /release ./
RUN chmod -R a+rw files application/logs/errors.log \
  webtrees/data/cache webtrees/data/media webtrees/data/tmp
