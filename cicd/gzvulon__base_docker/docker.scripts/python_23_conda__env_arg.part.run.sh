#!/bin/bash

PYVER=${PYVER:-py2.7}
PYEPATH=/root/miniconda3/envs/${PYVER}/bin
export PATH=$PYEPATH:$PATH
$@

