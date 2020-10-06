FROM alpine:latest

RUN apk update && apk add --ngo-cache --upgrade bash \
    && mkdir grafana && cd grafana \
    && apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat \
    && wget https://dl.grafana.com/oss/release/grafana-7.2.0.linux-amd64.tar.gz \
    && tar -zxvf grafana-7.2.0.linux-amd64.tar.gz \
    && cd /grafana/grafana-7.2.0/bin \
    && setsid ./grafana-server > /dev/null 2>&1

EXPOSE 3000

CMD bash