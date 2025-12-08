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
#     spack install locality-aware-git
#
# You can edit this file again by typing:
#
#     spack edit locality-aware-git
#
# See the Spack documentation for more information on packaging.
# ----------------------------------------------------------------------------

from spack_repo.builtin.build_systems.cmake import CMakePackage
from spack_repo.builtin.build_systems.cuda import CudaPackage
from spack_repo.builtin.build_systems.rocm import ROCmPackage
from spack_repo.builtin.build_systems.generic import Package

from spack.package import *


class Localityaware(CMakePackage, CudaPackage, ROCmPackage):
    """Locality-aware optimizations for standard MPI collectives as well as neighborhood collectives."""
    homepage = "https://github.com/mpi-advance/locality_aware"
    url = "https://github.com/mpi-advance/locality_aware"
    git = "https://github.com/mpi-advance/locality_aware"

    maintainers("aworley16", "TheMasterDirk", "bienz2")

    license("BSD-3-Clause")

    version("2.0.0", tag='v2.0.0')
    
    
    depends_on("c", type="build")
    depends_on("cxx", type="build")

    # Variants are primarily backends to build on GPU systems and pass the right
    # information to the packages we depend on
    variant("cuda", default=False, description="Build with CUDA support")
    variant("openmp", default=False, description="Build with OpenMP support")
    variant("rocm", default=False, description="Build with HIP support")

    # MPI dependencies
    depends_on("mpi")
    with when("+cuda"):
        depends_on("mpich +cuda", when="^[virtuals=mpi] mpich")
        depends_on("mvapich +cuda", when="^[virtuals=mpi] mvapich")
        depends_on("mvapich2 +cuda", when="^[virtuals=mpi] mvapich2")
        depends_on("mvapich2-gdr +cuda", when="^[virtuals=mpi] mvapich2-gdr")
        depends_on("openmpi +cuda", when="^[virtuals=mpi] openmpi")

    with when("+rocm"):
        depends_on("mpich +rocm", when="^[virtuals=mpi] mpich")
        depends_on("mvapich2-gdr +rocm", when="^[virtuals=mpi] mvapich2-gdr")
    
    conflicts("+cuda", when="cuda_arch=none")
    conflicts("+rocm", when="amdgpu_target=none")
  
    # CMake specific build functions
    def cmake_args(self):
        args = []



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
        return args
