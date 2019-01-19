#!/bin/bash

echo -eux

TAGNAME='stick-man'
NAME='stick-man1'

cat ./certs/privkey.pem ./certs/cert.pem

docker build . -t "$TAGNAME"
docker run --detach -p 443:443 -v "$(pwd)/certs:/certs:ro" --name "$NAME" "$TAGNAME"
docker logs -f "$NAME"

