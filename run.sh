#!/bin/sh
docker run --name JWPVik --link JMySQL:mysql -v /J/data/JWordpress/JWPVik:/var/www/html \
 -e WORDPRESS_DB_USER=JWPVik -e WORDPRESS_DB_PASSWORD=p#L5S8_8exduySM! -e WORDPRESS_DB_NAME=JWPVik \
 -e VIRTUAL_HOST=blog.vikramchauhan.me \
 --expose 80 -d vikramchauhan/wordpress
