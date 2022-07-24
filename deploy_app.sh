#!/bin/bash

BUILD="${1:-run}"
IMAGE_NAME=world-app
IMAGE_TAG=api

if [ $1 = "build" ]; then 
    echo "Building image"
    docker build -t "$IMAGE_NAME":"$IMAGE_TAG" .
fi

docker network create local

docker run --name world-flask -p 5000:5000 -v app:/usr/src/code -w /usr/src/code --network local --env-file ./.env -d "$IMAGE_NAME":"$IMAGE_TAG"
