#!/bin/bash

#!/bin/bash

# echo "running with $@"
if [[ "$1" == "--debug" ]]; then
    TBG='; cat /etc/os-release'
    shift
fi

if [[ "$1" == "bash" ]]; then
    ITTY='-it'
fi

export SCRIPT_DIR=$(dirname $(realpath "$0" || readlink -f "$0"))
export DIMG=$(cat "${SCRIPT_DIR}/dimg.txt")

docker run \
-e PYVER=${PYVER:-py3.6} \
${ITTY} \
--rm \
-v /var/run/docker.sock:/var/run/docker.sock \
-v $(pwd):$(pwd):rw \
-v /opt:/opt:rw \
--workdir $(pwd) \
${DIMG} \
$@

# bash -c "$@ ${TBG}"

# -v /home/$USER:/home/$USER \
# --user $(id -u):$(id -g) \
