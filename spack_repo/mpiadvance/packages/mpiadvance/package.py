# Copyright Spack Project Developers. See COPYRIGHT file for details.
#
# SPDX-License-Identifier: (Apache-2.0 OR MIT)

# ----------------------------------------------------------------------------
# If you submit this package back to Spack as a pull request,
# please first remove this boilerplate and all FIXME comments.
#
# This is a template package file for Spack.  We've put "FIXME"
# next to all the things you'll want to change. Once you've handled
# them, you can save this file and test your package like this:
#
#     spack install mpiadvance
#
# You can edit this file again by typing:
#
#     spack edit mpiadvance
#
# See the Spack documentation for more information on packaging.
# ----------------------------------------------------------------------------

from spack_repo.builtin.build_systems.cmake import CMakePackage
from spack_repo.builtin.build_systems.cuda import CudaPackage
from spack_repo.builtin.build_systems.rocm import ROCmPackage

from spack.package import *


class Mpiadvance(CMakePackage, CudaPackage, ROCmPackage):
    """Locality-aware optimizations for standard MPI collectives as well as neighborhood collectives."""

    homepage = "https://github.com/mpi-advance"
    url =" https://github.com/mpi-advance/mpi-advance.git"
    git = "git@github.com:mpi-advance/mpi-advance.git"

    maintainers("aworley16", "JStewart28", "TheMasterDirk")

    license("BSD-3-Clause")
    
    version("main", branch="experimental", submodules=True)
    
    depends_on("c", type="build")
    depends_on("cxx", type="build")
    
    # Variants are primarily backends to build on GPU systems and pass the right
    # informtion to the packages we depend on
    variant("cuda", default=False, description="Use CUDA support from subpackages")
    variant("openmp", default=False, description="Use OpenMP support from subpackages")
    
    # varients for disabling various sublibraries
    variant("pcl", default=True, description="Build MPIPCL library")
    variant("st",  default=True, description="Build Stream-triggering library")
    variant("la",  default=True, description="Build Stream-triggering library")
    variant("tests", default=False, description="Build examples and test programs")
    variant("cuda", default=False, description="Build MPIPCL library")

    # MPI dependencies
    depends_on("mpi")
    with when("+cuda"):
        depends_on("mpich +cuda", when="^[virtuals=mpi] mpich")
        depends_on("mvapich +cuda", when="^[virtuals=mpi] mvapich")
        depends_on("mvapich2 +cuda", when="^[virtuals=mpi] mvapich2")
        #depends_on("mvapich2-gdr +cuda", when="^[virtuals=mpi] mvapich2-gdr")
        depends_on("openmpi +cuda", when="^[virtuals=mpi] openmpi")

    with when("+rocm"):
        depends_on("mpich +rocm", when="^[virtuals=mpi] mpich")
        #depends_on("mvapich2-gdr +rocm", when="^[virtuals=mpi] mvapich2-gdr")
    
    conflicts("+cuda", when="cuda_arch=none")
    conflicts("+rocm", when="amdgpu_target=none")

    # If we're using CUDA or ROCM, require MPIs be GPU-aware
    conflicts("mpich ~cuda", when="+cuda")
    conflicts("mpich ~rocm", when="+rocm")
    conflicts("openmpi ~cuda", when="+cuda")
    conflicts("^intel-mpi")  # Heffte won't build with intel MPI because of needed C++ MPI support
    # Commenting so we can test C++20 and cuda@12.2.1 on Lassen
    # conflicts("^spectrum-mpi", when="^cuda@11.3:") # cuda-aware spectrum is broken with cuda 11.3:

    # CMake specific build functions
    def cmake_args(self):
        args = []
        print("!!--!!")
        args.append("-DSPACK=ON")
        #Parse libraries NOT to be installed. 
        if self.spec.satisfies("+pcl"):
            print("PC SET")
            args.append("-DMPIA_PC=ON")
        else:
            print("PC NOT SET")
            
        if self.spec.satisfies("+st"):
            print("ST SET")
            args.append("-DMPIA_ST=ON")          
        else:
            print("ST NOT SET") 
            
        if self.spec.satisfies("+la"):
            print("LA SET")
            args.append("-DMPIA_LA=ON")
        else:
            print("LA NOT SET")   
        
        #add in tests if requested
        if self.spec.satisfies("+tests"):
            print("TESTS TO BE BUILT")
            args.append("-BUILD_TESTS=ON")        #for MPIPCL
            args.append("-DENABLE_UNIT_TESTS=ON") #for locality_aware
        args.append("-DSPACK=ON")                 #change to spack install location instead of default. 
        
        # If using CUDA, add flags to activate CUDA build options and arch. 
        if self.spec.satisfies("+cuda"):
            print("BUILDING CUDA SUPPORT")
            mystring = ', '.join(map(str, self.spec.variants["cuda_arch"].value)) 
            print("detected arch values:" + mystring)
            cuda_val = "-DCMAKE_CUDA_ARCHITECTURES=" + mystring
            args.append(cuda_val)
            #turn on cuda flags for each of the sub-modules. 
            if self.spec.satisfies("la"):
                args.append("-DUSE_CUDA=ON")
                #args.append("-DCMAKE_CUDA_ARCHITECTURES=\"75\"")
            if self.spec.satisfies("st"):
                args.append("-DUSE_CUDA_BACKEND=ON")
          
        # If using HIP or ROCM, use hpicc instead of changing the CMAKE_CXX_COMPILER. 
        # Doing this perserves the spack wrapper and the integrated rpath setting from 
        # the spec. 
        if self.spec.satisfies("+rocm"):
            env["SPACK_CXX"] = self.spec["hip"].hipcc
        # If we're building with cray mpich, we need to make sure we get the GTL library for
        # gpu-aware MPI
        if self.spec.satisfies("+rocm ^cray-mpich"):
            gtl_dir = join_path(self.spec["cray-mpich"].prefix, "..", "..", "..", "gtl", "lib")
            args.append(
                "-DCMAKE_EXE_LINKER_FLAGS=-Wl,-rpath={0} -L{0} -lmpi_gtl_hsa".format(gtl_dir)
            )
        elif self.spec.satisfies("+cuda ^cray-mpich"):
            gtl_dir = join_path(self.spec["cray-mpich"].prefix, "..", "..", "..", "gtl", "lib")
            args.append(
                "-DCMAKE_EXE_LINKER_FLAGS=-Wl,-rpath={0} -L{0} -lmpi_gtl_cuda".format(gtl_dir)
            )
        
        #Set hip flags in the submodules
        if self.spec.satisfies("la"):
            args.append("-DUSE_HIP=ON")
        if self.spec.satisfies("st"):
            args.append("-DUSE_HIP_BACKEND=ON")
        return args

    @run_after('install')
    @on_package_attributes(test=True) # Run only when --test is provided
    def check(self):
        """Run CTest tests."""
        with working_dir(self.build_directory):
            ctest_command = ["ctest", "--output-on-failure"]
            self.run_command(ctest_command)