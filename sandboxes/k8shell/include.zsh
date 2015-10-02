#!/usr/bin/env zsh

#includes for k8s zsh config
function k8shell() {
    mkdir -p ~/.vagrant.d
    local name=$(_docker_shell_name "k8shell")

    mkdir -p /tmp/$name-home

    if [ -e /dev/vboxdrv ]; then
        echo "Driver found. Everything is okay."

        docker run -it \
            --rm \
            --name $name \
            -P=true \
            --privileged \
            --net=host \
            -e DISPLAY \
            -e QT_GRAPHICSSYSTEM=native \
            -e XAUTHORITY \
            -e TERM \
            -e SHELL=/bin/zsh \
            -u $USER \
            -v /dev/vboxdrv:/dev/vboxdrv \
            -v /etc/passwd:/etc/passwd:ro \
            -v /etc/group:/etc/group:ro \
            -v /etc/sudoers:/etc/sudoers:ro \
            -v /etc/sudoers_app.d:/etc/sudoers_app.d:ro \
            -v /etc/sudoers.cmd_policy.include:/etc/sudoers.cmd_policy.include:ro \
            -v /etc/localtime:/etc/localtime \
            -v /tmp/.X11-unix:/tmp/.X11-unix \
            -v /tmp/$name-home:$HOME \
            -v $HOME/.Xauthority:$HOME/.Xauthority \
            -v $HOME/.oh-my-zsh:$HOME/.oh-my-zsh \
            -v $HOME/.dircolors:$HOME/.dircolors  \
            -v $HOME/.zsh_history:$HOME/.zsh_history \
            -v $HOME/.vagrant.d:$HOME/.vagrant.d \
            -v $SANDBOXES/k8shell/zshrc:$HOME/.zshrc \
            -v $SANDBOXES/core.zsh:$HOME/.core.zsh \
            -v `pwd`:/project \
            markmandel/k8shell \
            zsh

        rm -r /tmp/$name-home

    else
        echo "Compiling the driver..."
        docker run -it \
            --rm \
            --name $name \
            --privileged \
            -v /dev:/dev \
            markmandel/k8shell \
            /etc/init.d/vboxdrv setup

        #Then start up the shell
        k8shell
    fi
}