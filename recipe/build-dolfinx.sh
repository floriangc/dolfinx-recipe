#!/bin/bash
set -eux

export LIBRARY_PATH=$PREFIX/lib
export INCLUDE_PATH=$PREFIX/include

export PETSc_DIR=$PREFIX
export SLEPC_DIR=$PREFIX
export BLAS_DIR=$LIBRARY_PATH

cd dolfinx/cpp
mkdir build
cd build

cmake .. \
  -DDOLFINX_ENABLE_SLEPC=on \
  -DDOLFINX_SKIP_BUILD_TESTS=FALSE \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DCMAKE_INSTALL_LIBDIR=$PREFIX/lib \
  -DCMAKE_INCLUDE_PATH=$INCLUDE_PATH \
  -DCMAKE_LIBRARY_PATH=$LIBRARY_PATH \
  -DPython3_ROOT_DIR=$PREFIX \
  -DPython3_FIND_STRATEGY=LOCATION \
  -DSCOTCH_ROOT=$PREFIX \
  -DHDF5_ROOT=$PREFIX || (cat CMakeFiles/CMakeError.log && exit 1)

make -j${CPU_COUNT} install

#source $PREFIX/lib/dolfinx/dolfinx.conf
