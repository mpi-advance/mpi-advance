@PACKAGE_INIT@

include("${CMAKE_CURRENT_LIST_DIR}/MPIAdvanceTargets.cmake")

find_package(OpenMP)
find_package(MPIAdvance::MPIPCL)
find_package(MPIAdvance::locality_aware)
find_package(MPI REQUIRED)