FROM wordpress:5-php7.4-apache
MAINTAINER Vikram Chauhan <me@vkrm.ch>

ENV RUN_USER=www-data \
    RUN_GROUP=www-data \
    RUN_UID=5555 \
    RUN_GID=5555 \
    WORDPRESS_DB_USER=user \
    WORDPRESS_DB_PASSWORD=pass \
    WORDPRESS_DB_NAME=db \
    WORDPRESS_DB_HOST=mysql \
    WORDPRESS_DB_CHARSET=utf8 \
    WORDPRESS_DB_COLLATE='' \
    WORDPRESS_AUTH_KEY='' \
    WORDPRESS_SECURE_AUTH_KEY='' \
    WORDPRESS_LOGGED_IN_KEY='' \
    WORDPRESS_NONCE_KEY='' \
    WORDPRESS_AUTH_SALT='' \
    WORDPRESS_SECURE_AUTH_SALT='' \
    WORDPRESS_LOGGED_IN_SALT='' \
    WORDPRESS_NONCE_SALT='' \
    WORDPRESS_TABLE_PREFIX='wp_' \
    WORDPRESS_DEBUG='' \
    WORDPRESS_CONFIG_EXTRA=''

# Change uid and gid of www-data/www-data
RUN usermod -u $RUN_UID $RUN_USER \
    && groupmod -g $RUN_GID $RUN_GROUP \
    && apt-get -y update \
    && apt-get -y install --no-install-recommends freetype* zlib1g-dev libpng-dev libjpeg-dev libfreetype6-dev \
    && docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo pdo_mysql \
    && docker-php-ext-enable gd mysqli pdo pdo_mysql \
    && chown -R $RUN_USER:$RUN_GROUP /usr/local/etc/php/conf.d/ \
    && apt-get -y clean \
    && apt-get -y autoclean \
    && apt-get -y autoremove