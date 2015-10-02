#!/usr/bin/env zsh

#includes for k8s zsh config
function k8shell() {
    set -x

    local mount="-v /dev/:/dev/"
    mkdir -p ~/.vagrant.d

    if [ -e /dev/vboxdrv ]; then
        mount="-v /dev/vboxdrv:/dev/vboxdrv"
    fi

    echo "Mount: $mount"

    _docker_zsh "k8shell" "/project" \
        "--net=host" \
        "--privileged" \
        "-e DISPLAY" \
        "-e QT_GRAPHICSSYSTEM=native" \
        "-e XAUTHORITY" \
        $mount \
        "-v $HOME/.Xauthority:$HOME/.Xauthority" \
        "-v /tmp/.X11-unix:/tmp/.X11-unix" \
        "-v $HOME/.vagrant.d:$HOME/.vagrant.d"

        set +x
}