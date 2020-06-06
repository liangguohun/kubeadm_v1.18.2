#!/bin/bash

set -e

KUBE_VERSION=v1.18.2
KUBE_PAUSE_VERSION=3.2
ETCD_VERSION=3.4.3-0
CORE_DNS_VERSION=1.6.7

GCR_URL=k8s.gcr.io
ALIYUN_URL=registry.aliyuncs.com/google_containers

# In Kubernetes 1.12 and later, the k8s.gcr.io/kube-*, k8s.gcr.io/etcd and k8s.gcr.io/pause images don’t require an -${ARCH} suffix
images=(kube-proxy:${KUBE_VERSION}
kube-scheduler:${KUBE_VERSION}
kube-controller-manager:${KUBE_VERSION}
kube-apiserver:${KUBE_VERSION}
pause:${KUBE_PAUSE_VERSION}
etcd:${ETCD_VERSION}
coredns:${CORE_DNS_VERSION})


for imageName in ${images[@]} ; do
  docker pull $ALIYUN_URL/$imageName
  docker tag  $ALIYUN_URL/$imageName $GCR_URL/$imageName
  docker rmi $ALIYUN_URL/$imageName
done

docker images



