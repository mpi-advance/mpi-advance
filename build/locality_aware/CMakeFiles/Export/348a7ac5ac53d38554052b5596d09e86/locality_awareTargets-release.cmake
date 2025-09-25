#----------------------------------------------------------------
# Generated CMake target import file for configuration "RELEASE".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "MPIAdvance::locality_aware" for configuration "RELEASE"
set_property(TARGET MPIAdvance::locality_aware APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(MPIAdvance::locality_aware PROPERTIES
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib/liblocality_aware.so"
  IMPORTED_SONAME_RELEASE "liblocality_aware.so"
  )

list(APPEND _cmake_import_check_targets MPIAdvance::locality_aware )
list(APPEND _cmake_import_check_files_for_MPIAdvance::locality_aware "${_IMPORT_PREFIX}/lib/liblocality_aware.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
