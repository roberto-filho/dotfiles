#
# A Vagrant, Virtualbox, and K8s Docker file.
#

FROM ubuntu:14.04
MAINTAINER Mark Mandel <mark.mandel@gmail.com>

RUN apt-get update && \
    apt-get install -y software-properties-common openssh-client wget curl gdebi-core zsh build-essential linux-headers-`uname -r` dkms

#
# Install Virtualbox
#

RUN wget --quiet -O virtualbox.deb http://download.virtualbox.org/virtualbox/5.0.4/virtualbox-5.0_5.0.4-102546~Ubuntu~trusty_amd64.deb && \
    gdebi -n virtualbox.deb && \
    rm virtualbox.deb

RUN mkdir /project

#
# Install vagrant
#
RUN wget --quiet -O vagrant.deb https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.4_x86_64.deb && \
    gdebi -n vagrant.deb && \
    rm vagrant.deb

#
# Install Kubernetes
#

WORKDIR /tmp

ENV KUBERNETES_PROVIDER=vagrant
RUN wget --quiet https://github.com/kubernetes/kubernetes/releases/download/v1.0.6/kubernetes.tar.gz
RUN chmod go+rw /tmp/kubernetes.tar.gz
RUN tar -xf kubernetes.tar.gz && \
    cp ./kubernetes/platforms/linux/amd64/* /usr/local/bin && \
    chmod go+rx /usr/local/bin/*

WORKDIR /project