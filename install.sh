#!/usr/bin/env sh

# installation script for CUBA

set -euxo

install_module(){
    if [ -n "${VIRTUAL_ENV-}" ]
    then
        install_path="${VIRTUAL_ENV}"
    elif [ -n "${CONDA_PREFIX-}" ]
    then
        install_path="${CONDA_PREFIX}"
    else
        # we hope that this exists
        if stat "/usr/local" >/dev/null 2>&1
        then
            install_path="/usr/local"
        else
            install_path="/usr"
        fi
    fi
    autoreconf --install && ./configure --prefix="${install_path}" CFLAGS=-fPIC && make install
}

install_module

set +euxo
