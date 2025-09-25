#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "MPIAdvance::stream-triggering" for configuration ""
set_property(TARGET MPIAdvance::stream-triggering APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(MPIAdvance::stream-triggering PROPERTIES
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib/libstream-triggering.so"
  IMPORTED_SONAME_NOCONFIG "libstream-triggering.so"
  )

list(APPEND _cmake_import_check_targets MPIAdvance::stream-triggering )
list(APPEND _cmake_import_check_files_for_MPIAdvance::stream-triggering "${_IMPORT_PREFIX}/lib/libstream-triggering.so" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
