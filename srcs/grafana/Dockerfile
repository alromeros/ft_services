FROM alpine

WORKDIR /usr/share/grafana

RUN apk update && apk add bash curl wget grafana \
--repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ \
&& rm -rf /var/cache/apk/*

COPY src/datasource.yaml /usr/share/grafana/conf/provisioning/datasources/

RUN mkdir /usr/share/grafana/conf/provisioning/dashboards/mine
COPY src/*.json /usr/share/grafana/conf/provisioning/dashboards/mine/

COPY start.sh /
EXPOSE 3000

CMD /start.sh
