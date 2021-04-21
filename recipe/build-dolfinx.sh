#!/bin/bash

cd dolfinx

cd cpp
mkdir build
cd build

export LIBRARY_PATH=$PREFIX/lib
export INCLUDE_PATH=$PREFIX/include

export PETSC_DIR=$PREFIX
export SLEPC_DIR=$PREFIX
export BLAS_DIR=$LIBRARY_PATH

cmake .. \
  -DDOLFIN_ENABLE_MPI=on \
  -DDOLFIN_ENABLE_PETSC=on \
  -DDOLFIN_ENABLE_SLEPC=on \
  -DDOLFIN_ENABLE_SCOTCH=on \
  -DDOLFIN_ENABLE_HDF5=on \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DCMAKE_INSTALL_LIBDIR=$PREFIX/lib \
  -DCMAKE_INCLUDE_PATH=$INCLUDE_PATH \
  -DCMAKE_LIBRARY_PATH=$LIBRARY_PATH \
  -DCMAKE_PREFIX_PATH=${PREFIX} \
  # -DCMAKE_FIND_FRAMEWORK=LAST \
  -DPython3_FIND_STRATEGY=LOCATION || (cat CMakeFiles/CMakeError.log && exit 1)
make install

#
# cd ../../python
# python -m pip install . --no-deps
