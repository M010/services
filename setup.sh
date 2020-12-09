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

kubectl apply -f ./yamll/metallb-config.yaml
kubectl apply -f yamll

DIRS="mysql wordpress nginx phpmyadmin ftps influxdb telegraf grafana"

for dir in $DIRS
do
	docker build ./$dir -t my_$dir
	kubectl apply -f  ./$dir
        echo -e "\e[32 $dir configured\e[0m"
done
