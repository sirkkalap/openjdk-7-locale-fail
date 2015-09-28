#!/bin/bash

if [[ $(docker info) != *"Kernel Version:"* ]]; then
    echo "Unable to connect with Docker."
    exit 1
fi

PROJECT=project
CONTAINER_NAME=build

read -r -d '' SCRIPT <<- End
    cd /$PROJECT
    bash -x ./run.sh
End

IMG=java:openjdk-7u79-jdk
MOUNT="-v $(pwd)/$PROJECT:/$PROJECT"
NAME="--name $CONTAINER_NAME"
OPTS="-it --sig-proxy=true"

docker rm -f $CONTAINER_NAME 2>/dev/null # Clean up old builds
docker run $OPTS $NAME $VOLFROM $MOUNT $IMG /bin/bash -c "$SCRIPT"