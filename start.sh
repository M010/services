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
DIRS="FTPS nginx grafana"
kubectl apply -f ./yamll/metallb-config.yaml
kubectl apply -f yamll
for var in $DIRS
do
	docker build ./$var -t my_$var
	kubectl apply -f  ./$var
done
#docker build ./FTPS -t my_ftps
#kubectl apply -f  ./FTPS
#
#docker build ./grafana -t my_ftps
#kubectl apply -f  ./grafana
fi
