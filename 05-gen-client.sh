#!/bin/bash

source util.sh

if [ -z "${1}" ]; then
	echo "No client name" 
	exit 1
fi

docker run --volumes-from ${OVPN_DATA} --rm -it ${IMAGE} easyrsa build-client-full "${1}" nopass
docker run --volumes-from ${OVPN_DATA} --rm ${IMAGE} ovpn_getclient "${1}" > "${1}.ovpn"

echo "Your new client config is located at $(pathOf ${1}.ovpn)"

