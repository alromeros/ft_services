FROM alpine

RUN apk update\
    && apk add --no-cache --upgrade bash\
    && wget https://wordpress.org/latest.zip\
    && unzip latest.zip\
    && apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session \
    && mkdir /var/www \
    && mv wordpress/* /var/www

COPY ./wp-config.php /var/www/wp-config.php

EXPOSE 5050

CMD php -S 0.0.0.0:5050 -t /var/www/;
