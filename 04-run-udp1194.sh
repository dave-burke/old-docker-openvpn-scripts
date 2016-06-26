#!/bin/bash

source util.sh

stopContainer ${UDP_CONTAINER}
removeContainer ${UDP_CONTAINER}

echo "Running container..."
docker run --volumes-from ${OVPN_DATA} --restart=always --detach --publish 1194:1194/udp --cap-add=NET_ADMIN --name "${UDP_CONTAINER}" ${IMAGE}

