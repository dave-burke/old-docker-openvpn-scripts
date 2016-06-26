#!/bin/bash

source util.sh

docker run --volumes-from ${OVPN_DATA} --rm -it ${IMAGE} ovpn_initpki
