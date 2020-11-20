#! /bin/bash

docker rmi -f phpmyadmin42
docker rm -f phpmyadmin42
docker build -t phpmyadmin42 srcs/phpmyadmin