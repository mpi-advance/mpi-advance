#----------------------------------------------------------------
# Generated CMake target import file for configuration "RELEASE".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "MPIAdvance::MPIPCL" for configuration "RELEASE"
set_property(TARGET MPIAdvance::MPIPCL APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(MPIAdvance::MPIPCL PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libMPIPCL.so.1.4.0"
  IMPORTED_SONAME_RELEASE "libMPIPCL.so.1"
  )

list(APPEND _cmake_import_check_targets MPIAdvance::MPIPCL )
list(APPEND _cmake_import_check_files_for_MPIAdvance::MPIPCL "${_IMPORT_PREFIX}/lib/libMPIPCL.so.1.4.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
