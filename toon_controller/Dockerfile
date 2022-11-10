ARG BUILD_FROM
FROM $BUILD_FROM

# Install deps

RUN apk add --no-cache \
  curl \
  nginx \
  php81 \
  php81-ctype \
  php81-curl \
  php81-dom \
  php81-fpm \
  php81-gd \
  php81-intl \
  php81-mbstring \
  php81-mysqli \
  php81-opcache \
  php81-openssl \
  php81-phar \
  php81-session \
  php81-xml \
  php81-xmlreader \
  supervisor \
  git

# Create symlink so programs depending on `php` still function
RUN ln -s /usr/bin/php81 /usr/bin/php

# Configure nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Configure PHP-FPM
COPY fpm-pool.conf /etc/php81/php-fpm.d/www.conf
COPY php.ini /etc/php81/conf.d/custom.ini

# Configure supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Set working dir
WORKDIR /var/www/html

# Get run script in place
COPY run.sh /
RUN chmod a+x /run.sh

# Make sure files/folders needed by the processes are accessable when they run under the nobody user
RUN chown -R nobody.nobody /var/www/html /run /var/lib/nginx /var/log/nginx

# Switch to use a non-root user from here on
USER nobody

CMD [ "/run.sh"]
