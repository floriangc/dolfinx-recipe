#!/bin/bash

export LIBRARY_PATH=$PREFIX/lib
export INCLUDE_PATH=$PREFIX/include

cd basix

cmake -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_PREFIX_PATH=${PREFIX} \
      -DCMAKE_INSTALL_PREFIX=${PREFIX} \
      -DCMAKE_INCLUDE_PATH=$INCLUDE_PATH \
      -DCMAKE_LIBRARY_PATH=$LIBRARY_PATH \
      -B build-dir -S .
cmake --build build-dir
cmake --install build-dir

cd python
python -m pip install . --no-deps
