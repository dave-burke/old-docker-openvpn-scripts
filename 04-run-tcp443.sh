#!/bin/bash

source util.sh

stopContainer ${TCP_CONTAINER}
removeContainer ${TCP_CONTAINER}

echo "Running container..."
docker run --volumes-from ${OVPN_DATA} --detach --restart=always --publish 443:1194/tcp --cap-add=NET_ADMIN --name "${TCP_CONTAINER}" ${IMAGE} ovpn_run --proto tcp

