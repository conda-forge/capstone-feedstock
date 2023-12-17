#!/bin/bash

set -exuo pipefail

pushd bindings/python
make install3
make install3_cython
if [[ "$(python -c 'import sys; print(sys.implementation.name)')" == "cpython" ]]; then
  if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR:-}" != "" ]]; then
    make check
  fi
fi
popd

