# Copyright 2013-2024 Lawrence Livermore National Security, LLC and other
# Spack Project Developers. See the top-level COPYRIGHT file for details.
#
# SPDX-License-Identifier: (Apache-2.0 OR MIT)

from spack_repo.builtin.build_systems.cmake import CMakePackage

from spack.package import *


class Mpipcl(CMakePackage):
    """An open source shared library that implements the partitioned communication interface approved in MPI 4.0
        mpipcl is a part of the MPI-Advance Project developed.
    """

    homepage = "https://github.com/mpi-advance/MPIPCL.git"
    url = "https://github.com/mpi-advance/MPIPCL.git"
    git = "git@github.com:mpi-advance/MPIPCL.git"

    maintainers("aworley16", "TheMasterDirk")
    license("BSD-3-Clause", checked_by="aworley16")

    version("1.5.0", tag='v1.5.0')
    version("1.4.0", tag='v1.4.0')
    version("1.3.0", tag='v1.3.0', deprecated=True)
    version("1.2.0", tag='v1.2.0', deprecated=True)
    version("1.1.2", tag='v1.1.2', deprecated=True)
    version("1.1.1", tag='v1.1.1', deprecated=True)
    version("1.0.0", tag='v1.0.0', deprecated=True)


    variant("static_libs", default=False, description="Build static MPIPCL library instead of shared library")
    variant("debug", default=False, description="Turn on debug statments inside library")
    variant("examples", default=False, description="Build Example programs")
    variant("~benchmarks", default=True, description="Do not build benchmarks programs")
    
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
        if self.spec.satisfies("~benchmarks"):
            args.append("-DBENCHMARKS=OFF")
        return args
