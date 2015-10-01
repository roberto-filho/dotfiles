#!/usr/bin/env zsh

#includes for k8s zsh config
function k8shell() {
    _docker_zsh "k8shell" "/project" \
        "--privileged" \
        "-e DISPLAY" \
        "-e QT_GRAPHICSSYSTEM=native" \
        "-e XAUTHORITY" \
        "-v /dev/:/dev/" \
        "-v $HOME/.Xauthority:$HOME/.Xauthority" \
        "-v /tmp/.X11-unix:/tmp/.X11-unix"
}