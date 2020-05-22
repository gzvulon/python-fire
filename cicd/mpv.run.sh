#!/bin/bash
set -e
# set -x

for PYVER in $( eval echo ${PY_VERSIONS} )
do
    source activate py${PYVER}
    $@
done

# echo ${PY_VERSIONS} \
#     | xargs -n 1 \
#     | xargs -I {} -P${XPROC} \
#     bash -c "source activate py{} && $@"

