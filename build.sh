#!/bin/bash

set -e
mkdir -p bin
rm -f bin/*

echo "=> Building docker image"
docker build -t ngrok-builder build 

docker run --rm -v $(pwd)/bin:/release:rw -v $1:/ca.pem:r ngrok-builder
echo "=> Binaries has been carved to 'bin' folder"
