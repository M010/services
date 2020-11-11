#!/bin/bash
minikube delete
minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
minikube addons enable metallb
alias klaf="kubectl apply -f"
klaf ./srcs/yamll/metallb-config.yaml
klaf apply -f /srcs/yamll
docker build ./srcs/Nginx -t my_nginx
klaf ./srcs/Nginx/nginx-deployment.yaml
