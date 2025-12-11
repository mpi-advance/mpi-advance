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
    git = "https://github.com/mpi-advance/mpi-advance.git"

    maintainers("aworley16", "TheMasterDirk")

    license("BSD-3-Clause")
    
    version("main", branch="experimental", submodules=True)
    
    depends_on("c", type="build")
    depends_on("cxx", type="build")
    
    # Variants are primarily backends to build on GPU systems and pass the right
    # information to the packages we depend on
    variant("cuda", default=False, description="Build sub-packages with CUDA support if possible")
    variant("rocm", default=False, description="Build sub-packages with HIP support if available")
    
    # varients for disabling various sub-packages
    variant("pcl", default=True, description="Build MPIPCL library")
    variant("st",  default=True, description="Build Stream-triggering library")
    variant("la",  default=True, description="Build locality-aware library")
    
    depends_on('mpipcl', when='+pcl')
    depends_on('stream-triggering', when='+st')
    depends_on('localityaware',  when='+la')

    conflicts("+cuda", when="+rocm")
    conflicts("+rocm", when="cuda")
    conflicts("+cuda", when="cuda_arch=none")
    conflicts("+rocm", when="amdgpu_target=none")

    with when("+cuda"):
        for cuda_arch in CudaPackage.cuda_arch_values:
            depends_on(f'stream-triggering cuda_arch={cuda_arch}', when=f' +st cuda_arch={cuda_arch}')
            depends_on(f'localityaware cuda_arch={cuda_arch}', when=f' +la cuda_arch={cuda_arch}')

    with when("+rocm"):
        for arch in ROCmPackage.amdgpu_targets:
            depends_on(f'stream-triggering amdgpu_target={arch}', when=f'+rocm +st amdgpu_target={arch}')
            depends_on(f'localityaware amdgpu_target={arch}', when=f'+rocm +la amdgpu_target={arch}')

    # CMake specific build functions
    def cmake_args(self):
        args = []
        args.append("-DBUILD_LIGHT=ON")
        # #Parse libraries NOT to be installed. 
        if self.spec.satisfies("+pcl"):
            args.append("-DMPIA_PC=ON")
            
        if self.spec.satisfies("+st"):
            args.append("-DMPIA_ST=ON")          
            
        if self.spec.satisfies("+la"):
            args.append("-DMPIA_LA=ON")
          
        return args