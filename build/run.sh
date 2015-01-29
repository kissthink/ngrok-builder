#!/bin/bash
set -e
git clone https://github.com/inconshreveable/ngrok.git ngrok
cd ngrok

if [ -f /ca.pem ]; then
    echo "=> Found client certificate"
    cp /ca.pem assets/client/tls/ngrokroot.crt
else
    echo "=> Generate self signed client certificate with Common Name: ${COMMON_NAME}"
    openssl genrsa -out base.key 2048
    openssl req -new -x509 -nodes -key base.key -days 10000 -subj "/CN={COMMON_NAME}" -out base.pem
    cp base.pem assets/client/tls/ngrokroot.crt
fi

echo "=> Compiling ngrok binary files"
make release-server release-client

echo "=> Copy ngrok to '/release' folder"
cp -f bin/ngrok /release/ngrok
echo "=> Copy ngrokd to '/release' folder"
cp -f bin/ngrokd /release/ngrokd
