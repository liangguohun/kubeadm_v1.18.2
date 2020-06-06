#!/bin/bash

set -e

# https://istio.io/docs/setup/getting-started/
# 链接不了
# curl -L http://istio.io/downloadIstio | ISTIO_VERSION=1.4.3 sh -
# wget -O istio-1.6.0.tar.gz http://github.com/istio/istio/releases/download/1.6.0/istio-1.6.0-linux-amd64.tar.gz
tar -zxvf istio-1.6.0-linux-amd64.tar.gz
cd istio-1.6.0
export PATH=$PWD/istio-1.6.0/bin:$PATH
