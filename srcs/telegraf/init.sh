#! /bin/bash

docker rmi -f telegraf42
docker rm -f telegraf42
docker build -t telegraf42 srcs/telegraf