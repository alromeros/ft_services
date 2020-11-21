# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: alromero <alromero@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/05/19 16:13:51 by alromero          #+#    #+#              #
#    Updated: 2020/11/21 14:03:16 by alromero         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash

GREEN='\x1b[32m'
BLINK='\x1b[5m'

echo -e $GREEN"Starting minikube"$BLINK
if [[ $(minikube status | grep -c “Running”) == 0 ]]
then
    minikube start --cpus=2 --memory 4000 --vm-driver=virtualbox --extra-config=apiserver.service-node-port-range=1-35000
    #minikube start
    minikube addons enable metrics-server
    minikube addons enable ingress
    minikube addons enable dashboard
fi
# Set the docker images in Minikube
MINIKUBE_IP=$(minikube ip)
sleep 1;
eval $(minikube docker-env)

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

kubectl apply -f srcs/metallb.yml

#docker build -t nginx42 srcs/nginx
srcs/nginx/init.sh
srcs/wordpress/init.sh
srcs/mysql/init.sh
srcs/phpmyadmin/init.sh
srcs/grafana/init.sh
srcs/influxdb/init.sh
srcs/ftps/init.sh
srcs/telegraf/init.sh
#docker build -t wordpress42 srcs/wordpress

kubectl apply -f srcs/nginx.yml
kubectl apply -f srcs/ftps.yml
kubectl apply -f srcs/mysql.yml
kubectl apply -f srcs/wordpress.yml
kubectl apply -f srcs/phpmyadmin.yml
kubectl apply -f srcs/grafana.yml
kubectl apply -f srcs/influxdb.yml
kubectl apply -f srcs/telegraf.yml
