# MPI Advance
This repository contains packages and publicly released libraries that comprise the MPI Advance Project. The MPI Advance Project currently consists of the following libraries:

- Partitioned Communication: implements basic partitioned communication for MPI 3 compatible implementations (See MPI 4.0 Standard). [MPIPCL](https://github.com/mpi-advance/MPIPCL)
- Locality_aware: Collective algorithms for topology aware and sparse matrix communication. [Locality_Aware](https://github.com/mpi-advance/locality_aware)
- Stream-triggering: scheduled triggering of communication function by GPUs. [Stream-Triggering](https://github.com/mpi-advance/stream-triggering

## Building
This repository offers three modes of building, each of which will be explained in more detail below:
1. Using the repository's CMake files to build other MPI Advance libraries (included as git submodules)
2. Manually installing some (or all)  MPI Advance libraries by other means, and then using this repository's `BUILD_LIGHT` CMake option to only install CMake files to make `find_package(MPIAdvance)` work
3. Using the repository's spack package files provided in the custom spack repository.
### Building from source

#### Prerequisites
While the CMake code for this repository only requires CMake 3.17 or newer, more prerequisites may be required if building the included git submodules. For exact prerequisites, please refer to the documentation of the MPI Advance packages you are building.

#### Initialize & Update Submodules
When building from the CMake code, you have the option to also build out all (or some of) the other MPI Advance libraries. To do this, first initialize the submodules, by running `git submodule init` in the top level of the repository (if not initialized when cloning this repository). Each submodule is set to pull the latest version of the associated library. After the submodules have been initialized, they can be updated to the latest version by running. `git submodule update --remote` 
After checking that all the submodules are present, the build process follows a normal CMake build:
```
   <cd to top level of MPI Advance repository>
	mkdir build
	cd build
	cmake .. <CMAKE OPTIONS> 
	make install
```
Individual libraries can be built from each submodule as well, by following the above instructions side the top level of each submodule. 

##### CMAKE Options
This repository offers the ability to choose which MPI Advance libraries get built. NOTE: this will affect the final CMake package file that gets installed. For example, if you choose to only build the MPIPCL library, then doing `find_package(MPIAdvance)` will only attempt to look for `MPIPCL`. 
- `-DMPIA_PC` (ON): Build the Partitioned Communication library
- `-DMPIA_ST` (ON) : Build the Stream-triggering Library
- `-DMPIA_LA` (ON) : Build the Locality_Aware Library

In addition to selection which libraries get build, there are other options that influence some of the libraries in the collection: 
- `-DCUDA_SUPPORT` (OFF) : Build libraries with CUDA Support. In order to use this option you may need to provide the target GPU architecture if it is not set in the environment. The specific architecture of an NVIDIA GPU can be found by searching for the GPU model on NVIDIA's compute capability list and supplying the compute capability via -DCMAKE_CUDA_ARCHITECTURES. You should ignore the decimal when supplying the architecture. For example: a GeForce RTX 4080 has a compute capability of 8.9 thus to build for it you would use `-DCMAKE_CUDA_ARCHITECTURES=89.`
- `-DHIP` (OFF) : Build libraries with HIP Support. Build the library with HIP support. In order to use this option you may need to provide the target GPU architecture if it is not set in the environment. The specific architecture of an AMD GPU can be found by searching for the GPU model at ROCM capability list and supplying the compute capability via -DCMAKE_HIP_ARCHITECTURES. For example: `-DCMAKE_HIP_ARCHITECTURES=gfx942`
- `-DCXI` (OFF) : Build stream-triggering Library with CXI backend
- `-DBUILD_TESTS` (OFF) : Build available examples and tests 

While these options comprise a majority of the available build options for each library, additional options may be available when building individual libraries, please check the official repositories if more control is necessary for the build. 

#### Lightweight Build
A variant of the CMake build that only installs the final CMake package files is also offered by this repository. This style of build may be helpful for when another project needs to use `find_package(MPIAdvance)`, but already has a collection of MPI Advance libraries installed. In this case, setting `-DBUILD_LIGHT=ON` (along with the correct packages to include), will prevent this repository from attempting to build and install any MPI Advance library, and instead only install the final CMake package file.

### Install using Spack
The final build option provided by this library leverages Spack.

#### Add the package repo to Spack
Spack packages for each library are provided as a spack_package repo inside the named folder. 
To add the repo to your installation of spack.

1. Clone spack from https://github.com/spack/spack if not already installed 
1. Activate spack, `. spack/share/spack/setup-env.sh`
2. Navigate inside the spack_packages directory. 
3. Use `spack repo add mpiadvance`
4. Run `spack repo list` to verify that spack has found and linked the MPI Advance spack repository.

#### Installing the Spack Packages
Inside the provided spack package repo, there is a individual package for each library well as a wrapper package that will install the others as dependencies.

**Variants:**
- ~PC: Do not build Partitioned Communication
- ~ST: Do not build Stream-triggering
- ~LA: Do not bUILD Locality_aware
- +CUDA: Build with CUDA support**
- +ROCM: Build with HIP support.** 
- test: Enable unit testing where available. 

**If installing with CUDA or HIP support, you must provide either the `cuda_arch` or `hip_architecture` in your Spack environment or via command-line. 

#### Using the Spack Packages
You will need to load the package to add it to your path. `spack load <package name>`

If the package is not found make sure it has been installed with `spack find`

Once loaded the packages can be found by CMake using the find_package and linked to your target. All libraries are installed under the MPI Advance namespace. 

Each MPI Advance package provides its own CMake package file that can be used in other projects, and exports its targets under the `MPIAdvance` CMake namespace:
```
	find_package(locality_aware)
	target(my_app source_code.cpp)
	target_link_libraries(my_app PUBLIC MPIAdvance::locality_aware)
```
Additionally, if this repository was used to install the packages (regardless of method, and assuming the "use library" CMake flags are set), it is also possible to use this CMake code:
```
	find_package(MPIAdvance)
	target(my_app source_code.cpp)
	target_link_libraries(my_app PUBLIC MPIAdvance::locality_aware)
```