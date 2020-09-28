#! /bin/bash

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
# Install metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey=“$(openssl rand -base64 128)”
docker build -t nginx42 srcs/nginx
kubectl apply -f srcs/metallb.yaml
kubectl apply -f srcs/nginx.yaml