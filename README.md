Ngrok-builder
============

This repo helps you build ngrok server and client binaries

Usage:
-----

To build ngrok with a self-signed client certificate from scratch, you may run:

```
    ./build-self-signed-cert.sh "*.tutum.co"
```
It will create a certificate with `Common Name` set to `*.tutum.co` and compile ngrok with this self generated certificate.

To build ngrok with an existing certificate, you may run:

```
    ./build.sh "you certificate path"
```

Then the binary files `ngrok` and `ngrokd` will be put in the folder `bin`

Run server:
-----------
```
    bin/ngrokd -tlsKey=server.key -tlsCrt=server.crt -domain="<your ngrok server domain>" -httpAddr=":80" -httpsAddr=":443"
```
This will run a ngrok server to tunnle HTTP traffic on port 80 and HTTPS traffic on port 443.
Notice: you may need `root` privilege to run the above command


Run client:
----------
First create a config file, say `ngrok.conf`, with the following contents:
```
server_addr: <ngrok server domain>:4443
trust_host_root_certs: true
```
If you use a self-signed certificate, please set `trust_host_root_certs: false`

Then you can start client tunneling using:
```
./ngrok -config=ngrok.conf -proto tcp 2375
```
