git submodule update --init --recursive

module purge

module load openmpi/3.1.4
module load cuda/12.5.1 

rm -rf build
mkdir -p build 

# @xianghao: not sure why clang & clang++ fail compilation
export CC=$(which gcc)
export CXX=$(which g++)

cd build
cmake -DCOSMA_BLAS=CUDA -DCOSMA_SCALAPACK=MKL \
    -DMKL_ROOT=/apps/intel-oneapi/mkl/2023.0.0 \
    ../COSMA
    
make -j 8
