#!/bin/bash

set -exuo pipefail

pushd bindings/python
# stops build from rebuilding library and vendoring it in site-packages; see
# https://github.com/capstone-engine/capstone/blob/5.0.6/bindings/python/setup.py#L166
# at runtime, we use a different mechanism to find the library (see patches)
export LIBCAPSTONE_PATH=some_value
# c.f. https://github.com/capstone-engine/capstone/blob/5.0.6/bindings/python/Makefile#L20
export DESTDIR=$PREFIX
make install3
popd

