FROM php:8.1-fpm

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt update && apt install --no-install-recommends -y \
&&  apt install zip libzip-dev -y \
&&  docker-php-ext-install zip pdo pdo_mysql 

COPY . .

RUN composer install

COPY scripts/start.sh .
RUN chmod +x start.sh
CMD ["./start.sh"]
