#!/bin/bash

set -exuo pipefail

mkdir -p $PREFIX/lib

export PKGCFGDIR=$PREFIX/lib/pkgconfig
make -j${CPU_COUNT}
make install

if [[ "${PKG_NAME}" != "cstool" ]]; then
  rm $PREFIX/bin/cstool
fi
