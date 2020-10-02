#! /bin/bash

docker rmi -f wordpress42
docker rm -f wordpress42
docker build -t wordpress42 srcs/wordpress