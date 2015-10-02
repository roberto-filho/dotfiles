#!/usr/bin/env zsh
tar -xf /tmp/kubernetes.tar.gz
cd ./kubernetes
./cluster/kube-up.sh
