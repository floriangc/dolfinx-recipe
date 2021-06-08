# dolfinx-recipe

Recipe for building conda package of dolfinx/ffcx/basix/ufl

```bash
conda build recipe -c conda-forge -c fgacon --output-folder conda-bld
```

Package are uploaded here: https://anaconda.org/fgacon/repo
To download it :

```bash
conda install -c conda-forge -c fgacon fenics-<PKG>
```
