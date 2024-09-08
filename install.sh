#!/bin/bash

echo -n "please enter the mirror address: "

read MIRROR

if [ -n "$MIRROR" ] && [ "${MIRROR: -1}" != "/" ]; then
    MIRROR+="/"
fi

cp `dirname $0`/docker-compose_.yml `dirname $0`/docker-compose.yml

sed -i "s|<mirror>|$MIRROR|g" `dirname $0`/docker-compose.yml

docker-compose up -d

