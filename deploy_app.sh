#!/bin/bash

build = $1

if [ $build = "build"]; then 
    echo "Building image"
    docker build -t world-app .
else
    docker run --name world-flask -p 5000:5000 -v app/:/opt/app -w /opt/app --network local --env-file ./.env -d world-app
fi

