#!/usr/bin/env bash
set -ex

# install C lib
export PREFIX="${PREFIX}"
./make.sh
./make.sh install

# install python lib
pushd bindings/python
make install3
make install3_cython
if [ "$python_impl" == "cpython" ]; then
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
  make check
fi
fi
popd

