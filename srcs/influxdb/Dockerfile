FROM alpine:latest

RUN apk update && apk add --no-cache --upgrade bash \
    && mkdir influx && cd influx \
    && apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat \
    && wget https://dl.influxdata.com/influxdb/releases/influxdb-1.8.3_linux_amd64.tar.gz \
    && tar xvfz influxdb-1.8.3_linux_amd64.tar.gz \
    && cd /influx/influxdb-1.8.3-1/usr/bin \
    && setsid ./influxdb > /dev/null 2>&1

EXPOSE 8086
   
CMD bash
