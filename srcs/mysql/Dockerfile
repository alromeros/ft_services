FROM alpine:latest

# installation
RUN apk update \
&& apk add mariadb mariadb-client && apk add --no-cache --upgrade bash \
&& rm -rf /var/cache/apk/*

# RUN service mysql start
RUN mysql --version

# Copy initialisation script
COPY ./setup.sh .
COPY ./initsql.sh .
COPY ./wordpress.sql .

# Add permission
RUN chmod 777 setup.sh
RUN chmod 777 initsql.sh

ENTRYPOINT [ "./setup.sh" ]