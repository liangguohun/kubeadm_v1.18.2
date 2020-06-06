#!/bin/bash

set -e

echo "step.1 -------------------------- create certes------------------------"

rm -rf dashboard-certs/
mkdir dashboard-certs
cd dashboard-certs/

# 创建key文件
openssl genrsa -out dashboard.key 2048

#证书请求
openssl req -days 36000 -new -out dashboard.csr -key dashboard.key -subj '/CN=dashboard-cert'

#自签证书
openssl x509 -req -in dashboard.csr -signkey dashboard.key -out dashboard.crt

cd ../
kubectl apply -f ./recommended.yaml
	
#创建kubernetes-dashboard-certs对象
kubectl create secret generic kubernetes-dashboard-certs --from-file=./dashboard-certs/dashboard.key --from-file=./dashboard-certs/dashboard.crt -n kube-system 

echo "step.2 -------------------------- create metrics service ------------------------"
cd ./metrics-server && kubectl apply -f . 

echo "step.3 -------------------------- generate access token ------------------------"
kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | grep kubernetes-dashboard | awk '{print $1}')

