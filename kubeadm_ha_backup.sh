#!/bin/bash

set -e

yum install -y keepalived

mkdir -p /etc/keepalived

\cp -rf ./configs/keepalived-backup.conf /etc/keepalived/keepalived.conf

\cp -rf ./configs/check-apiserver.sh /etc/check-apiserver.sh

systemctl enable keepalived && service keepalived start

systemctl status keepalived

# join need
./04_pull_kubernetes_images_from_aliyun.sh
