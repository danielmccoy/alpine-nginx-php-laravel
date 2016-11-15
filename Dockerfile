FROM alpine:3.3
MAINTAINER Daniel McCoy <danielmccoy@gmail.com>

# Install Nginx and PHP modules
RUN apk upgrade -U && \
  apk --update add \
  nginx \
  php-fpm \
  php-pdo \
  php-dom \
  php-json \
  php-openssl \
  php-pgsql \
  php-pdo_pgsql \
  php-mcrypt \
  php-sqlite3 \
  php-pdo_sqlite \
  php-ctype \
  php-zlib \
  php-phar \
  php-mysql \
  php-mysqli \
  php-pdo_mysql \
  php-curl \
  supervisor

# Housekeeping
RUN mkdir -p /etc/nginx
RUN mkdir -p /run/nginx
RUN mkdir -p /var/run/php-fpm
RUN mkdir -p /var/log/supervisor

# Copy base Nginx config
RUN rm /etc/nginx/nginx.conf
ADD nginx.conf /etc/nginx/nginx.conf

# Copy base Nginx sites-enabled
ADD sites-enabled /etc/nginx/sites-enabled

# Add Nginx and PHP-FPM supervisor
ADD nginx-supervisor.ini /etc/supervisor.d/nginx-supervisor.ini

# Send logs to stdout
RUN ln -sf /dev/stderr /var/log/nginx/error.log
RUN ln -sf /dev/stdout /var/log/nginx/access.log

# Site volume
VOLUME ["/var/www"]

# Start
CMD ["/usr/bin/supervisord"]
