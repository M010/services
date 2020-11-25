#!/bin/bash
read -p "Are you sure? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
minikube delete
minikube start --vm-driver=virtualbox
cd srcs
eval $(minikube docker-env)
minikube addons enable metallb
alias klaf="kubectl apply -f"
kubectl apply -f ./yamll/metallb-config.yaml
kubectl apply -f yamll
docker build ./Nginx -t my_nginx
kubectl apply -f  ./Nginx/nginx-deployment.yaml
fi
