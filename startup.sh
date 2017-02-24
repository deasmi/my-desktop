#!/bin/bash


# Hopefully these will work cross *NIX world
USER_NAME=$USER
USER_UID=$(id -u)
GROUP_GID=$(id -g)
GROUP_NAME=$USER

DOCKER_ID=$(docker ps -f "name=my-desktop" -q)


if [ -z $DOCKER_ID ];
then
    DOCKER_ID=$(docker run -d \
			-e "USER_NAME=${USER_NAME}" \
			-e "USER_UID=${USER_UID}" \
			-e "GROUP_GID=${GROUP_GID}" \
			-e "GROUP_NAME=${GROUP_NAME}" \
			-v $HOME:/home \
			--name my-desktop \
			deasmi-desktop)
    
    sleep 3
fi


docker exec -it -u $USER_UID $DOCKER_ID /bin/bash -li

