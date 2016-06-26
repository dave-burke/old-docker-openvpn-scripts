#!/bin/bash

set -e

cd "$(dirname ${0})"

if [ ! -f config.sh ]; then
	cp --verbose config.example config.sh
	read -p "Enter your domain name: " domain
	sed -i "s/DOMAIN=/DOMAIN=${domain}/" config.sh
fi

./01-create-data-volume.sh
./02-gen-config.sh
./03-init-pki.sh
./04-run-udp1194.sh
./04-run-tcp443.sh

read -p "Enter a name for your first client: " clientName

./05-gen-client.sh "${clientName}"

