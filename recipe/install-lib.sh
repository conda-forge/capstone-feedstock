#!/bin/bash

set -exuo pipefail

if [[ "${PKG_NAME}" == "cstool" ]]; then
  CAPSTONE_BUILD_CSTOOL=ON
else
  CAPSTONE_BUILD_CSTOOL=OFF
fi

cmake ${CMAKE_ARGS} \
  -G Ninja \
  -B build \
  -DCMAKE_BUILD_TYPE=Release \
  -DCAPSTONE_BUILD_SHARED_LIBS=1 \
  -DCAPSTONE_BUILD_CSTOOL=$CAPSTONE_BUILD_CSTOOL \
  -DCAPSTONE_BUILD_MACOS_THIN=ON

cmake --build build -j${CPU_COUNT}
cmake --install build
