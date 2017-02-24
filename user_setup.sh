#!/bin/bash

USER_UID=${USER_UID:-500}
USER_NAME=${USER_NAME:-deasmi}
PASSWORD=${PASSWORD:-changeme}
GROUP_GID=${GROUP_GID:-500}
GROUP_NAME=${GROUP_NAME:-deasmi}

getent group ${GROUP_NAME}
if [ $? -ne 0 ]; then
    groupadd -g ${GROUP_GID} ${GROUP_NAME}
fi

getent passwd ${USER_NAME}
if [ $? -ne 0 ]; then
    useradd --uid=${USER_UID} --gid=${GROUP_GID} -d /home ${USER_NAME}
    echo "${USER_NAME}:${PASSWORD}" | chpasswd
fi


while true
do
    sleep 500
done

