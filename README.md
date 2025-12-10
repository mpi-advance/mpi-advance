# MPI Advance
This repository contains packages and publicly released libraries that comprise the MPI Advance Project. The MPI Advance Project currently consists of the following libraries:

- Partitioned Communication: implements basic partitioned communication for MPI 3 compatible implementations (See MPI 4.0 Standard). [MPIPCL](https://github.com/mpi-advance/MPIPCL)
- Locality_aware: Collective algorithms for topology aware and sparse matrix communication. [Locality_Aware](https://github.com/mpi-advance/locality_aware)
- Stream-triggering: scheduled triggering of communication function by GPUs. [Stream-Triggering](https://github.com/mpi-advance/stream-triggering

## Building
This repository can be used to build some or all the current releases of the MPIAdvance libraries. The libraries included can be built from source with cmake or installed using the supplied spack packages. 

### Building from source

#### Prerequisites
- MPI implementation supporting MPI 3.0+
- CMake 3.17+
- C11+

#### Initialize & Update Submodules
Initialize the submodules, by running `git submodule init` in the top level of the repository. Each submodule is set to pull the latest version of the associated library. After the submodules have been initialized, they can be updated to the latest version by running. `git submodule update --remote` 

After the submodules are up to date run the following to install the libraries. This library has limited 
To build each library, navigate to the top level of each submodule. 
```
	mkdir build
	cd build
	cmake .. <CMAKE OPTIONS> 
	make install
```
##### CMAKE Options
- `-DMPIA_PC` (ON): Build the Partitioned Communication library
- `-DMPIA_ST` (ON) : Build the Stream-triggering Library
- `-DMPIA_LA` (ON) : Build the Locality_Aware Library
- `-DCUDA_SUPPORT` (OFF) : Build libraries with CUDA Support. In order to use this option you may need to provide the target GPU architecture if it is not set in the environment. The specific architecture of an NVIDIA GPU can be found by searching for the GPU model on NVIDIA's compute capability list and supplying the compute capability via -DCMAKE_CUDA_ARCHITECTURES. You should ignore the decimal when supplying the architecture. For example: a GeForce RTX 4080 has a compute capability of 8.9 thus to build for it you would use `-DCMAKE_CUDA_ARCHITECTURES=89.`
- `-DHIP` (OFF) : Build libraries with HIP Support. Build the library with HIP support. In order to use this option you may need to provide the target GPU architecture if it is not set in the environment. The specific architecture of an AMD GPU can be found by searching for the GPU model at ROCM capability list and supplying the compute capability via -DCMAKE_HIP_ARCHITECTURES. For example: `-DCMAKE_HIP_ARCHITECTURES=gfx942`
- `-DCXI` (OFF) : Build stream-triggering Library with CXI backend
- `-DHPE` (OFF) : Build stream-triggering library with HPE backend
- `-DBUILD_TESTS` (OFF) : Build available examples and tests 

While these options comprise a majority of the available build options for each library, additional options may be available when building individual libraries, please check the official repositories if more control is necessary for the build. 

### Install using Spack

#### Add the package repo to Spack
Spack packages for each library are provided as a spack_package repo inside the named folder. 
To add the repo to your installation of spack.

1. Clone spack from https://github.com/spack/spack if not already installed 
1. Activate spack, `. spack/share/spack/setup-env.sh`
2. Navigate inside the spack_packages directory. 
3. Use `spack repo add mpiadvance`
4. Run spack repo list to verify that spack has found and linked the repo. 

#### Installing the Spack Packages
Inside the provided spack package repo, there is a individual package for each library well as a wrapper package that will install the others as dependencies.

**Varients:**
- ~PC: Do not build Partitioned Communication
- ~ST: Do not build Stream-triggering
- ~LA: Do not bUILD Locality_aware
- +CUDA: Build with CUDA support**
- +ROCM: Build with HIP support.** 
- test: Enable unit testing where available. 

**If installing with CUDA or HIP support, you must provide either the `cuda_arch` or `hip_architecture` in your Spack environment or via command-line. 

#### Using the Spack Packages
You will need to load the package to add it to your path. `spack load <package name>

If the package is not found make sure it has been installed. `spack find`

Once loaded the packages can be found by cmake using the find_package and linking the package to your target. All libraries are installed under the MPIAdvance namespace. 
```
	find_package(locality_aware)
	target(my_app source_code.cpp)
	target_link_libraries(my_app PUBLIC MPIAdvance::locality_aware)
```