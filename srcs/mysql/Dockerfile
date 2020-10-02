FROM alpine:latest

RUN apk update\
    && apk add --no-cache --upgrade bash\
    && apk add mariadb mariadb-client\
    && mkdir -p /run/mysqld/ 

COPY initsql.sh /

RUN chmod +x initsql.sh

CMD nohup ./initsql.sh > /dev/null 2>&1 & /usr/bin/mysql_install_db --user=root --datadir="/var/lib/mysql" && /usr/bin/mysqld --user=root --datadir="/var/lib/mysql" && initsql.sh
