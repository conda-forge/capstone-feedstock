#!/bin/bash

set -exuo pipefail

pushd bindings/python
make install3
if [[ "$(python -c 'import sys; print(sys.implementation.name)')" == "cpython" ]]; then
  if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR:-}" != "" ]]; then
    python tests/test_all.py
  fi
fi
popd

