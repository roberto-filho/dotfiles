#!/usr/bin/env sh
echo "Adding user $HOST_USER"
groupadd --gid $HOST_GID $HOST_USER
useradd $HOST_USER --home /home/$HOST_USER --gid $HOST_GID --uid $HOST_UID --shell /usr/bin/zsh
echo "$HOST_USER:pw" | chpasswd
adduser $HOST_USER sudo
cp -r /kubernetes /home/$HOST_USER
chown -R $HOST_USER:$HOST_USER /home/$HOST_USER

if [ -e /dev/vboxdrv ]; then
    echo "Found VirtualBox Driver. Continuing..."
else
    echo "Could not find VirtualBox Driver. Ooops. Setting up...."
    /etc/init.d/vboxdrv setup
    echo "Exiting after setup"
    exit
fi

echo "Switch user muther fucker"
su $HOST_USER