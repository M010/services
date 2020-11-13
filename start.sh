#!/bin/bash
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
