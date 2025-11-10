# Copyright 2013-2024 Lawrence Livermore National Security, LLC and other
# Spack Project Developers. See the top-level COPYRIGHT file for details.
#
# SPDX-License-Identifier: (Apache-2.0 OR MIT)

from spack_repo.builtin.build_systems.cmake import CMakePackage

from spack.package import *


class Mpipcl(CMakePackage):
    """An open source shared library that implements the partitioned communication interface approved in MPI 4.0

        mpipcl is a part of the MPI-Advance Project developed and maintained by CUP-ECS.
    """

    homepage = "https://github.com/mpi-advance/MPIPCL.git"
    url = "https://github.com/mpi-advance/MPIPCL/archive/refs/tags/v1.4.0.tar.gz"
    git = "https://github.com/mpi-advance/MPIPCL.git"

    maintainers("aworley16")
    license("BSD-3-Clause", checked_by="aworley16")

    version("testing", branch="spack-target")

    version("1.4.0", tag='v1.4.0')
    version("1.3.0", sha256="ad65f5b87e57530927d1607fd7856f8d29bc34d4198490d34a70edefcd16f02a")
    version("1.2.0", sha256="6d28fdb452ed75a6c5623ac684aed39a71592524afca5804b39102d7a46bb6b8")
    version("1.1.2", sha256="37e842b0a1733df7e88df47cfbe95064077befbcc8bdfeb9fc0a9014c6e38a47")
    version("1.1.1", sha256="f620051102a55a2d613757bd78b31d1ea29efd29b897182bc40048a47fd37c75")
    version("1.0.0", sha256="e80b32ba7fc8f45cbd4295607c48bd100b1c2566a5fec143e0fb5a8f9d1b49f0")


    variant("static_libs", default=False, description="Build static MPIPCL library instead of shared library")
    variant("debug", default=False, description="Turn on debug statments inside library")
    variant("examples", default=False, description="Build Example programs")
    variant("unique_names", default=False, description="Changes the names of functions to use MPIP instead of MPIX")

    conflicts(
        "+examples", when="+unique_names", msg="No examples currently exist when using +unique_names"
    )
    
    depends_on("c", type="build")
    depends_on("cxx", type="build")
    depends_on("cmake")
    depends_on("mpi")
   
    def cmake_args(self):
        args = []
        if self.spec.satisfies("+static_libs"):
            args.append("-DDYNAMIC_LIBS=OFF")
        if self.spec.satisfies("+debug"):
            args.append("-DCMAKE_BUILD_TYPE=DEBUG")
        if self.spec.satisfies("+examples"):
            args.append("-DBUILD_EXAMPLES=ON")
            args.append("-DEXAMPLES_TO_BIN=ON")
        if self.spec.satisfies("+unique_names"):
            args.append("-DUNIQUE_NAMES=ON")

        return args
