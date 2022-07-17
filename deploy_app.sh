#!/bin/bash

BUILD="${1:-run}"

if [ $1 = "build" ]; then 
    echo "Building image"
    docker build -t world-app .
fi

docker network create local

docker run --name world-flask -p 5000:5000 -v app:/opt/app -w /opt/app --network local --env-file ./.env -d world-app

docker logs -f world-flask
