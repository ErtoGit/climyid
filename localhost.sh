#!/bin/bash

CDEF="\e[39m"
LRED="\e[91m"

function gen() {
    hugo
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
firebase serve