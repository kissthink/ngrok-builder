#!/bin/bash

set -e
mkdir -p bin
rm -f bin/*

echo "=> Building docker image"
docker build -t ngrok-builder build 
if [ "$1" == "" ]; then
    echo "=> No comman name is provided, use '*' instead !"
    docker run --rm -v $(pwd)/bin:/release:rw -e COMMON_NAME="*" ngrok-builder
else
    docker run --rm -v $(pwd)/bin:/release:rw -e COMMON_NAME="$1" ngrok-builder
fi

echo "=> Binaries has been carved to 'bin' folder"
