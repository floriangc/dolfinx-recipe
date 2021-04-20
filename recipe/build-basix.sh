#!/bin/bash

cd basix

cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH="${PREFIX}" -DCMAKE_INSTALL_PREFIX="${PREFIX}" -B build-dir -S .
cmake --build build-dir
cmake --install build-dir

cd python
python -m pip install . --no-deps
