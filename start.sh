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

kubectl apply -f ./yamll/metallb-config.yaml
kubectl apply -f yamll

DIRS="ftps nginx influxdb telegraf grafana"

for dir in $DIRS
do
	docker build ./$dir -t my_$dir
	kubectl apply -f  ./$dir
done

fi
