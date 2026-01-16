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
#     spack install stream-triggering
#
# You can edit this file again by typing:
#
#     spack edit stream-triggering
#
# See the Spack documentation for more information on packaging.
# ----------------------------------------------------------------------------

from spack_repo.builtin.build_systems.cmake import CMakePackage
from spack_repo.builtin.build_systems.cuda import CudaPackage
from spack_repo.builtin.build_systems.rocm import ROCmPackage
from spack_repo.builtin.build_systems.generic import Package
from spack.package import *


class StreamTriggering(CMakePackage, CudaPackage, ROCmPackage):
    """An MPI Advance library exploring various stream triggering APIs."""

    homepage = "https://github.com/mpi-advance/stream-triggering.git"
    url = "https://github.com/mpi-advance/stream-triggering.git"
    git = "https://github.com/mpi-advance/stream-triggering.git"
    # List of GitHub accounts to notify when the package is updated.
    maintainers("aworley16", "TheMasterDirk")

    # FIXME: Add the SPDX identifier of the project's license below.
    # See https://spdx.org/licenses/ for a list. Upon manually verifying
    # the license, set checked_by to your Github username.
    license("BSD-3-Clause")

    version("0.6.0", tag="v0.6.0")
    
    variant("threads", default=True, description="USE Thread backend")
    variant("cuda", default=False, description="Use CUDA backend")
    variant("cxi", default=False, description="Use CXI backend")
    variant("rocm", default=False, description="Use HIP backend")
   
    depends_on("c", type="build")
    depends_on("cxx", type="build")
    
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


    def cmake_args(self):
        args = []
        if self.spec.satisfies("~thread"):
            args.append("-DUSE_THREAD_BACKEND=ON")
        if self.spec.satisfies("+cuda"):
            args.append("-DUSE_CUDA_BACKEND=ON")
            mystring = ', '.join(map(str, self.spec.variants["cuda_arch"].value)) 
            cuda_val = "-DCMAKE_CUDA_ARCHITECTURES=" + mystring
            args.append(cuda_val)
        if self.spec.satisfies("+hip"):
            args.append("-DUSE_HIP_BACKEND=ON")
        if self.spec.satisfies("+cxi"):
            args.append("-DUSE_CXI_BACKEND=ON")  
        return args 
