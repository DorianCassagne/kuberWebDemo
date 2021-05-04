
FROM php:8-apache
ENV MYSQLIP "127.0.0.1:3306" 
COPY src  /var/www/public
COPY 000-default.conf /etc/apache2/sites-available/000-default.conf
RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN chown -R www-data:www-data /var/www
#ONBUILD RUN sed -i "s|ipvariable|$MYSQLIP|g" /var/www/public/Generique/modele_generique.php 
COPY entrypoint.sh /usr/local/bin/
RUN chmod 777 /usr/local/bin/entrypoint.sh
CMD ["entrypoint.sh"]
