#! /bin/bash

docker rmi -f mysql42
docker rm -f mysql42
docker build -t mysql42 srcs/mysql