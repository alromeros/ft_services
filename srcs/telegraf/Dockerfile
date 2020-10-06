FROM alpine:latest
    
RUN apk update && apk add --no-cache --upgrade bash \
    && wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.3_linux_amd64.tar.gz \
    && apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat \
    && tar xf telegraf-1.15.3_linux_amd64.tar.gz \
    && chmod +x telegraf-1.15.3/* \
    && cd telegraf-1.15.3/usr/bin/ \
    && ./telegraf -sample-config -input-filter cpu:mem:disk -output-filter influxdb > telegraf.conf 
    #&& ./telegraf --config telegraf.conf

EXPOSE 8125

CMD bash