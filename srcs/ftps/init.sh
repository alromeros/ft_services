#! /bin/bash

docker rmi -f ftps42
docker rm -f ftps42
docker build -t ftps42 srcs/ftps