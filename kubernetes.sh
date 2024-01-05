free -h 

swapoff -a

cat <<EOF > /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

yum install docker -y
mkdir -p $HOME/.kube
systemctl enable docker 
systemctl start docker 
systemctl status docker

cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=0
repo_gpgcheck=0
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

yum install kubelet-1.20.0  kubeadm-1.20.0  kubectl-1.20.0  kubernetes-cni -y

systemctl restart docker && systemctl enable docker && systemctl  restart kubelet && systemctl enable kubelet

kubeadm init --pod-network-cidr 10.244.0.0/16 --apiserver-advertise-address=

mkdir -p $HOME/.kube

sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

sudo chown $(id -u):$(id -g) $HOME/.kube/config

kubectl get nodes

kubectl get po --all-namespaces

alias k=kubectl

k get nodes

k get po --all-namespaces

curl https://raw.githubusercontent.com/projectcalico/calico/v3.24.5/manifests/canal.yaml -O

kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml 

kubectl apply -f https://docs.projectcalico.org/v3.9/manifests/calico.yaml 

k get no

k get po
 
