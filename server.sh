#!/bin/bash
. static/common.lib

flogo

function gen() {
    hugo server
}
(
    set -e 
    gen
)
errorCode=$?
if [ $errorCode -ne 0 ]; then
    echo -e "${LRED}×  Proses tidak dilanjutkan. Ada yang salah!${CDEF}"
    exit $errorCode
fi
# firebase serve