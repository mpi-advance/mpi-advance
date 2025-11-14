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
    """FIXME: Put a proper description of your package here."""

    # FIXME: Add a proper url for your package's homepage here.
    homepage = "https://github.com/mpi-advance/stream-triggering.git"
    url = "https://github.com/mpi-advance/stream-triggering.git"
    git = "git@github.com:mpi-advance/stream-triggering.git"
    # List of GitHub accounts to notify when the package is updated.
    maintainers("aworley16")

    # FIXME: Add the SPDX identifier of the project's license below.
    # See https://spdx.org/licenses/ for a list. Upon manually verifying
    # the license, set checked_by to your Github username.
    license("BSD-3-Clause")

    # FIXME: Add proper versions here.
    version("0.5.0", branch="main")

    depends_on("c", type="build")
    depends_on("cxx", type="build")

    variant("threads", default=True, description="USE Thread backend")
    variant("cuda", default=False, description="Use CUDA backend")
    variant("cxi", default=False, description="Use CXI backend")
    variant("hip", default=False, description="Use HIP backend")
   

    # FIXME: Add dependencies if required.
    # depends_on("foo")

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
