#!/bin/bash

set -e

echo "section 5 ========================="
# Reset firstly if ran kubeadm init before
#./kubeadm_ha_master.sh 

kubeadm reset -f

# kubeadm init with flannel netw.gcr.io
# kubeadm init --config=kubeadm-config.yaml --upload-certs 
kubeadm init --kubernetes-version=v1.18.2 --pod-network-cidr=10.244.0.0/16


mkdir -p $HOME/.kube
sudo cp /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
cp -p $HOME/.bash_profile $HOME/.bash_profile.bak$(date '+%Y%m%d%H%M%S')
echo "export KUBECONFIG=$HOME/.kube/config" >> $HOME/.bash_profile
source $HOME/.bash_profile


