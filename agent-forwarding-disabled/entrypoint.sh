#!/bin/bash

create_user() {
    groupadd remote
    useradd -s /bin/bash -d /home/$1 -G remote -m $1

    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /home/$1/powerlevel10k
    echo "source ~/powerlevel10k/powerlevel10k.zsh-theme" >>/home/$1/.zshrc
    echo "source /tmp/zshrc" >>/home/$1/.zshrc
}

add_credential() {
    passwd -d $1
    mkdir -p /home/$1/.ssh/
    cat /tmp/$PUB_KEY_NAME > /home/$1/.ssh/authorized_keys
    chmod 700 /home/$1/.ssh
    chmod 600 /home/$1/.ssh/authorized_keys
    chown -R $1:remote /home/$1/.ssh/

    if [ -n "${PRIVATE_KEY_NAME}" ]; then
        PUB_KEY="$PRIVATE_KEY_NAME.pub"

        cp /tmp/$PRIVATE_KEY_NAME /home/$1/.ssh/id_rsa
        cp /tmp/$PUB_KEY /home/$1/.ssh/id_rsa.pub

        chmod 400 /home/$1/.ssh/id_rsa
        chown -R $1:remote /home/$1/.ssh/
    fi
}

mkdir /var/run/sshd

create_user $ADMIN
add_credential $ADMIN

touch /var/log/auth.log
chmod 666 /var/log/auth.log

echo 'Start daemon'
/usr/sbin/sshd -D
