FROM alpine

RUN apk update\
	&& mkdir /www \
    && apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session \
    && rm -rf /var/vache/apk/* \
	&& wget https://wordpress.org/latest.tar.gz -P /tmp \
	&& mkdir -p /wordpress /run/php-fpm7 /www \
	&& tar xzf /tmp/latest.tar.gz --strip-components=1 -C /wordpress \
	&& sed -i -e 's/9000/5050/g' /etc/php7/php-fpm.d/www.conf \
	&& rm -rf /etc/php7/php-fpm.d/www.conf-e /var/cache/apk/*

COPY wp-config.php /wordpress
COPY setup.sh /
RUN chmod -R 775 /wordpress && chmod 775 setup.sh

COPY setup.sh .

RUN chmod +x setup.sh

EXPOSE 5050

CMD ./setup.sh