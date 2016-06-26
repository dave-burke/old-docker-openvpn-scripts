#!/bin/bash

source util.sh

docker run --name ${OVPN_DATA} -v /etc/openvpn busybox
