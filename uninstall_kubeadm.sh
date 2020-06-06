#!/bin/bash
systemctl stop kubelet
systemctl stop docker
modprobe -r ipip
lsmod
yum remove -y kubeadm kubectl kubelet kubernetes-cni cri-tools
rm -rf ~/.kube/
rm -rf /etc/systemd/system/kubelet.service.d
rm -rf /etc/systemd/system/kubelet.service
rm -rf /usr/bin/kube*
rm -rf /etc/cni
rm -rf /opt/cni
rm -rf /var/lib/etcd
rm -rf /var/etcd
rm -rf /var/lib/kubelet 
rm -rf /var/lib/dockershim 
rm -rf /var/lib/cni
rm -rf /etc/kubernetes
