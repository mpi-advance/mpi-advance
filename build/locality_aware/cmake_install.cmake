# Install script for directory: /home/aworley/MPI_advance/mpi-advance/locality_aware

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/aworley/MPI_advance/mpi-advance/build/installed")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

# Set path to fallback-tool for dependency-resolution.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/objdump")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/aworley/MPI_advance/mpi-advance/build/locality_aware/src/utils/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/aworley/MPI_advance/mpi-advance/build/locality_aware/src/communicator/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/aworley/MPI_advance/mpi-advance/build/locality_aware/src/persistent/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/aworley/MPI_advance/mpi-advance/build/locality_aware/src/collective/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/aworley/MPI_advance/mpi-advance/build/locality_aware/src/neighborhood/cmake_install.cmake")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}/home/aworley/MPI_advance/mpi-advance/build/installed/lib/libmpi_advance.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/aworley/MPI_advance/mpi-advance/build/installed/lib/libmpi_advance.so")
    file(RPATH_CHECK
         FILE "$ENV{DESTDIR}/home/aworley/MPI_advance/mpi-advance/build/installed/lib/libmpi_advance.so"
         RPATH "")
  endif()
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/aworley/MPI_advance/mpi-advance/build/installed/lib/libmpi_advance.so")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/aworley/MPI_advance/mpi-advance/build/installed/lib" TYPE SHARED_LIBRARY FILES "/home/aworley/MPI_advance/mpi-advance/build/locality_aware/libmpi_advance.so")
  if(EXISTS "$ENV{DESTDIR}/home/aworley/MPI_advance/mpi-advance/build/installed/lib/libmpi_advance.so" AND
     NOT IS_SYMLINK "$ENV{DESTDIR}/home/aworley/MPI_advance/mpi-advance/build/installed/lib/libmpi_advance.so")
    if(CMAKE_INSTALL_DO_STRIP)
      execute_process(COMMAND "/usr/bin/strip" "$ENV{DESTDIR}/home/aworley/MPI_advance/mpi-advance/build/installed/lib/libmpi_advance.so")
    endif()
  endif()
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/aworley/MPI_advance/mpi-advance/build/installed/include/mpi_advance.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/aworley/MPI_advance/mpi-advance/build/installed/include" TYPE FILE FILES "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/mpi_advance.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/aworley/MPI_advance/mpi-advance/build/installed/include/utils/utils.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/aworley/MPI_advance/mpi-advance/build/installed/include/utils" TYPE FILE FILES "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/utils/utils.h")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/aworley/MPI_advance/mpi-advance/build/installed/include/communicator/comm_data.h;/home/aworley/MPI_advance/mpi-advance/build/installed/include/communicator/comm_pkg.h;/home/aworley/MPI_advance/mpi-advance/build/installed/include/communicator/locality_comm.h;/home/aworley/MPI_advance/mpi-advance/build/installed/include/communicator/mpix_comm.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/aworley/MPI_advance/mpi-advance/build/installed/include/communicator" TYPE FILE FILES
    "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/communicator/comm_data.h"
    "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/communicator/comm_pkg.h"
    "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/communicator/locality_comm.h"
    "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/communicator/mpix_comm.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/aworley/MPI_advance/mpi-advance/build/installed/include/collective/alltoall.h;/home/aworley/MPI_advance/mpi-advance/build/installed/include/collective/alltoallv.h;/home/aworley/MPI_advance/mpi-advance/build/installed/include/collective/collective.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/aworley/MPI_advance/mpi-advance/build/installed/include/collective" TYPE FILE FILES
    "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/collective/alltoall.h"
    "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/collective/alltoallv.h"
    "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/collective/collective.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/aworley/MPI_advance/mpi-advance/build/installed/include/persistent/neighbor_persistent.h;/home/aworley/MPI_advance/mpi-advance/build/installed/include/persistent/persistent.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/aworley/MPI_advance/mpi-advance/build/installed/include/persistent" TYPE FILE FILES
    "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/persistent/neighbor_persistent.h"
    "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/persistent/persistent.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/home/aworley/MPI_advance/mpi-advance/build/installed/include/neighborhood/dist_graph.h;/home/aworley/MPI_advance/mpi-advance/build/installed/include/neighborhood/dist_topo.h;/home/aworley/MPI_advance/mpi-advance/build/installed/include/neighborhood/neighbor.h;/home/aworley/MPI_advance/mpi-advance/build/installed/include/neighborhood/neighbor_init.h;/home/aworley/MPI_advance/mpi-advance/build/installed/include/neighborhood/sparse_coll.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/home/aworley/MPI_advance/mpi-advance/build/installed/include/neighborhood" TYPE FILE FILES
    "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/neighborhood/dist_graph.h"
    "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/neighborhood/dist_topo.h"
    "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/neighborhood/neighbor.h"
    "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/neighborhood/neighbor_init.h"
    "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/neighborhood/sparse_coll.h"
    )
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/aworley/MPI_advance/mpi-advance/build/locality_aware/src/collective/tests/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/aworley/MPI_advance/mpi-advance/build/locality_aware/src/neighborhood/tests/cmake_install.cmake")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for the subdirectory.
  include("/home/aworley/MPI_advance/mpi-advance/build/locality_aware/benchmarks/cmake_install.cmake")
endif()

string(REPLACE ";" "\n" CMAKE_INSTALL_MANIFEST_CONTENT
       "${CMAKE_INSTALL_MANIFEST_FILES}")
if(CMAKE_INSTALL_LOCAL_ONLY)
  file(WRITE "/home/aworley/MPI_advance/mpi-advance/build/locality_aware/install_local_manifest.txt"
     "${CMAKE_INSTALL_MANIFEST_CONTENT}")
endif()
