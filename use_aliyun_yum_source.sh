#!/bin/bash

set -e

#wget -O /etc/yum.repos.d/CentOS7-Aliyun.repo http://mirrors.aliyun.com/repo/Centos-7.repo

# 要删除否则 failure: repodata/repomd.xml from epel: [Errno 256] No more mirrors to try.
sed -i "s/\$releasever/7/g" Centos-7.repo
rm -rf /etc/yum.repos.d/* 
cp -p ./Centos-7.repo  /etc/yum.repos.d
cp -p ./epel-7-Aliyun.repo /etc/yum.repos.d

yum clean all
yum makecache -y
yum repolist all

yum install wget -y
ntpdate time1.aliyun.com
