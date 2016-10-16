#!/bin/bash

source util.sh

docker create --name ${OVPN_DATA} -v /etc/openvpn busybox
