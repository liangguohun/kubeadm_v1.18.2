# Install kubeadm v1.18.2

* Use Aliyun Yum repo
* Use Aliyun Docker repo
* Use Aliyun Kubernetes repo
* Docker 19.03.11
* kubeadm 1.18.2
* kubelet 1.18.2
* kubectl 1.18.2
* calico  v1.14.2

## pre did
chmod +x *.sh

## init master
kubeadm_init_master.sh

## init node
```
> kubeadm_join_node.sh
then run the command on master to get the join command
> kubeadm token create --print-join-command
run the result on node
then run 
./kubeadm_join_node_must_test.sh
```
## init dashboard
cd k8s_dashboard_v2.0.0
./install-dashboard.sh

## tools
some .sh may no work£¬because win format.
net tool dos2unix
> dos2unix *.sh

## note:

open port limit: \
vi /etc/kubernetes/manifests/kube-apiserver.yaml \
add line bellow:  \
- --service-node-port-range=10-32767
