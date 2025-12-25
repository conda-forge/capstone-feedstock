#!/bin/bash

set -exuo pipefail

pushd bindings/python
make install3
popd

