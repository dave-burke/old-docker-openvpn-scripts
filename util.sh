# COMMON FUNCTIONS

function pathOf {
	if command -v realpath > /dev/null; then
		echo "$(realpath ${1})"
	else
		# Doesn't work with symlinks
		echo "$(cd $(dirname ${1}); pwd)/$(basename ${1})"
	fi
}

function stopContainer {
	cid="$(docker ps -q --filter "name=${1}")"
	if [ -n "${cid}" ]; then
		echo "Stopping container..."
		docker stop "${1}" > /dev/null
	fi
}

function removeContainer {
	cid="$(docker ps -a -q --filter "name=${1}")"
	if [ -n "${cid}" ]; then
		echo "Removing container..."
		docker rm "${1}" > /dev/null
	fi
}

source config.sh

