FROM alpine:latest

RUN apk add influxdb

EXPOSE	8086

CMD 	influxd run -config /etc/influxdb.conf