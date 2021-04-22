#!/bin/bash

export LIBRARY_PATH=$PREFIX/lib
export INCLUDE_PATH=$PREFIX/include

export PETSC_DIR=$PREFIX
export SLEPC_DIR=$PREFIX
export BLAS_DIR=$LIBRARY_PATH

cd dolfinx
cd cpp
mkdir build
cd build

cmake .. \
  -DDOLFINX_ENABLE_MPI=on \
  -DDOLFINX_ENABLE_PETSC=on \
  -DDOLFINX_ENABLE_SLEPC=on \
  -DDOLFINX_ENABLE_SCOTCH=on \
  -DDOLFINX_ENABLE_HDF5=on \
  -DDOLFINX_SKIP_BUILD_TESTS=FALSE \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DCMAKE_INSTALL_LIBDIR=$PREFIX/lib \
  -DCMAKE_INCLUDE_PATH=$INCLUDE_PATH \
  -DCMAKE_LIBRARY_PATH=$LIBRARY_PATH \
  -DPython3_ROOT_DIR=$PREFIX \
  -DPython3_FIND_STRATEGY=LOCATION \
  -DSCOTCH_ROOT=$PREFIX \
  -DHDF5_ROOT=$PREFIX || (cat CMakeFiles/CMakeError.log && exit 1)
make -j$CPU_COUNT install

#
# cd ../../python
# python -m pip install . --no-deps
