#!/bin/bash

set -e

./use_aliyun_kubernetes_yum_source.sh

#这会造成中断后面的不执行
#setenforce 0
yum install -y kubelet-1.18.2 kubeadm-1.18.2 kubectl-1.18.2
# kubernetes-cni-0.7.5

# Check installed Kubernetes packages
yum list installed | grep kube

systemctl enable kubelet && systemctl start kubelet

# Configure cgroup matched with Docker
#./configure_cgroup.sh
systemctl daemon-reload
systemctl restart kubelet
