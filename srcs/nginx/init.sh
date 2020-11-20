#! /bin/bash

docker rmi -f nginx42
docker rm -f nginx42
docker build -t nginx42 srcs/nginx