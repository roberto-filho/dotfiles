#!/usr/bin/env sh
groupadd --gid $HOST_GID $HOST_USER
useradd $HOST_USER --home /home/$HOST_USER --gid $HOST_GID --uid $HOST_UID --shell /usr/bin/zsh
echo "$HOST_USER:pw" | chpasswd
chown $HOST_USER:$HOST_USER /home/$HOST_USER
adduser $HOST_USER sudo

if [ ! -f /dev/vboxdrv ]; then
    echo "Could not find VirtualBox Driver. Ooops. Setting up...."
    /etc/init.d/vboxdrv setup
else
    echo "Found VirtualBox Driver."
fi

su $HOST_USER