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
#     spack install mpiadvance2
#
# You can edit this file again by typing:
#
#     spack edit mpiadvance2
#
# See the Spack documentation for more information on packaging.
# ----------------------------------------------------------------------------

from spack_repo.builtin.build_systems.bundle import BundlePackage

from spack.package import *


class Mpiadvance2(BundlePackage):
    """FIXME: Put a proper description of your package here."""

    # FIXME: Add a proper url for your package's homepage here.
    homepage = "https://www.example.com"
    # There is no URL since there is no code to download.

    # FIXME: Add a list of GitHub accounts to
    # notify when the package is updated.
    # maintainers("github_user1", "github_user2")

    # FIXME: Add the SPDX identifier of the project's license below.
    # See https://spdx.org/licenses/ for a list. Upon manually verifying
    # the license, set checked_by to your Github username.
    license("UNKNOWN", checked_by="github_user1")

    # FIXME: Add proper versions here.
    version('1.0', preferred=True)

    variant("mpist", default=False, description="Builds a shared version of the library")


    # FIXME: Add dependencies if required.
    depends_on('mpipcl')
    depends_on('localityaware')
    depends_on('stream-triggering', when='+mpist')
    
    # There is no need for install() since there is no code.
