#
# A Vagrant, Virtualbox, and K8s Docker file.
#

FROM ubuntu:14.04
MAINTAINER Mark Mandel <mark.mandel@gmail.com>

RUN apt-get update && \
    apt-get install -y software-properties-common wget gdebi-core zsh x11-apps build-essential linux-headers-`uname -r` dkms

#
# Install Virtualbox
#

RUN wget --quiet -O vagrant.deb http://download.virtualbox.org/virtualbox/5.0.4/virtualbox-5.0_5.0.4-102546~Ubuntu~trusty_amd64.deb && \
    gdebi -n vagrant.deb && \
    rm vagrant.deb

RUN mkdir /project

ADD startup.sh /root/startup.sh
RUN chmod +x /root/startup.sh
