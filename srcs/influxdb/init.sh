#! /bin/bash

docker rmi -f influxdb42
docker rm -f influxdb42
docker build -t influxdb42 srcs/influxdb