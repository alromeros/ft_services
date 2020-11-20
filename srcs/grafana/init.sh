#! /bin/bash

docker rmi -f grafana42
docker rm -f grafana42
docker build -t grafana42 srcs/grafana