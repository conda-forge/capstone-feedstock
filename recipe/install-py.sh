#!/bin/bash

set -exuo pipefail

pushd bindings/python
$PYTHON -m pip install . -vv
if [[ "$($PYTHON -c 'import sys; print(sys.implementation.name)')" == "cpython" ]]; then
  if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR:-}" != "" ]]; then
    $PYTHON tests/test_all.py
  fi
fi
popd

