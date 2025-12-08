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
    # information to the packages we depend on
    variant("cuda", default=False, description="Build sub-packages with CUDA support if possible")
    variant("rocm", default=False, description="Build sub-packages with HIP support if available")
    variant("openmp", default=False, description="Use OpenMP support from subpackages")
    
    # varients for disabling various sub-packages
    variant("pcl", default=True, description="Build MPIPCL library")
    variant("st",  default=True, description="Build Stream-triggering library")
    variant("la",  default=True, description="Build locality-aware library")
    
    depends_on("mpi")
    when 
    depends_on('mpipcl', when='+pcl')
    depends_on('stream-triggering', when='+st')
    depends_on('localityaware',  when='+la')
    
    # depends_on('stream-triggering+cuda', when='+cuda')
    # depends_on('localityaware+cuda', when='+cuda')
    
    # depends_on('stream-triggering+rocm', when='+rocm')
    # depends_on('localityaware+rocm', when='+rocm')
    
    # conflicts("+cuda", when="cuda_arch=none")
    # conflicts("+rocm", when="amdgpu_target=none")
    

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

    @run_after('install')
    @on_package_attributes(test=True) # Run only when --test is provided
    def check(self):
        """Run CTest tests."""
        with working_dir(self.build_directory):
            ctest_command = ["ctest", "--output-on-failure"]
            self.run_command(ctest_command)