#----------------------------------------------------------------
# Generated CMake target import file for configuration "RELEASE".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "MPIPCL::MPIPCL" for configuration "RELEASE"
set_property(TARGET MPIPCL::MPIPCL APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(MPIPCL::MPIPCL PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/libMPIPCL.so.1.4.0"
  IMPORTED_SONAME_RELEASE "libMPIPCL.so.1"
  )

list(APPEND _cmake_import_check_targets MPIPCL::MPIPCL )
list(APPEND _cmake_import_check_files_for_MPIPCL::MPIPCL "${_IMPORT_PREFIX}/lib/libMPIPCL.so.1.4.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
