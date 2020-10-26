#! /bin/bash

docker rmi -f phpmy42
docker rm -f phpmy42
docker build -t phpmy42 srcs/phpmyadmin