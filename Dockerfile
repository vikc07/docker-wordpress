FROM wordpress:latest
MAINTAINER Vikram Chauhan chauhanv@outlook.com

# Install gd and freetype
RUN apt-get -y update \ 
 && apt-get -y install php5-gd freetype* \
 && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
 && docker-php-ext-install -j$(nproc) gd
