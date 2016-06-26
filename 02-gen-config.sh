#!/bin/bash

source util.sh

docker run --volumes-from ${OVPN_DATA} --rm ${IMAGE} ovpn_genconfig -u udp://${DOMAIN}
