FROM alpine

RUN apk add update\
    && apk add --upgrade bash\
    && wget https://wordpress.org/latest.zip\
    && unzip latest.zip\
    && apk add php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip

EXPOSE 5050

