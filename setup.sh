#!/bin/bash
read -p "Are you sure?[Y/y] " -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    echo
    exit 1
fi
echo
minikube delete
minikube start --vm-driver=virtualbox

cd srcs
eval $(minikube docker-env)
minikube addons enable metallb
minikube addons enable metrics-server;
minikube addons enable dashboard;


kubectl apply -f ./metallb-config.yaml
#kubectl apply -f yamll

DIRS="mysql wordpress nginx phpmyadmin ftps influxdb telegraf grafana"

for dir in $DIRS
do
	docker build ./$dir -t my_$dir && echo -e "🐋 \e[33m $dir IMAGE created\n \e[0m"
	kubectl apply -f  ./$dir       &&  echo -e "😎 \e[33m  $dir deployed to k8s\n \e[0m"
done
