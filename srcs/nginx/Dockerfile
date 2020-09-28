FROM alpine

RUN apk update \
	&& apk add nginx \
	&& apk add --no-cache --upgrade bash \
	&& apk add openssl \
	&& apk add openssh \
	&& mkdir /run/nginx 

ADD ./nginx.conf /etc/nginx/nginx.conf

ADD ./index.html /var/www/index.html

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj \
	"/C=ES/ST=Madrid/L=Madrid/O=42"

RUN ssh-keygen -A

EXPOSE 80 22 443

CMD  /usr/sbin/sshd; /usr/sbin/nginx -g 'daemon off;'
