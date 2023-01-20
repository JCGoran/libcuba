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
        printf 'No virtual env or conda env detected, aborting...\n'
        return 1
    fi
    autoreconf --install && ./configure --prefix="${install_path}" CFLAGS=-fPIC && make install
}

install_module

set +euxo
