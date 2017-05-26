#!/bin/bash

set -e

cd $(dirname ${0})

source util.sh

docker pull ${IMAGE}
./04-run-tcp443.sh
./04-run-udp1194.sh

