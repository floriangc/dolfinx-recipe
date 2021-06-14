#!/bin/bash
set -eux

unset CMAKE_PREFIX_PATH

# scrub problematic -fdebug-prefix-map from C[XX]FLAGS
# these are loaded in the clang[++] activate scripts
export CFLAGS=$(echo $CFLAGS | sed -E 's@\-fdebug\-prefix\-map[^ ]*@@g')
export CXXFLAGS=$(echo $CXXFLAGS | sed -E 's@\-fdebug\-prefix\-map[^ ]*@@g')
export PETSc_DIR=$PREFIX/lib

cp dolfinx/cpp/cmake/modules/FindPETSc.cmake dolfinx/python/cmake/FindPETSc.cmake

# install Python bindings
cd dolfinx/python
$PYTHON -m pip install -v --no-deps .
#cd test
#$PYTHON -c 'from dolfin import *; info(parameters["form_compiler"], True)'