cmake_minimum_required(VERSION 3.17 FATAL_ERROR) 
project(MPI_Advance VERSION 1.0.0 LANGUAGES C)

option(MPIA_PC "build MPIPCL shared library." ON)
option(MPIA_ST "Build MPIA Stream Triggering Library." ON)
option(MPIA_TA "BUILD MPIA Topology Aware Libraries." ON)

include_directories(./include)
set(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_SOURCE_DIR}/installed" CACHE PATH "install prefix" FORCE)
message(STATUS "INSTALL PREFIX is : ${CMAKE_INSTALL_PREFIX}")

if(MPIA_PC)
	add_subdirectory(./MPIPCL)
endif(MPIA_PC)

if(MPIA_ST)
	add_subdirectory(./stream-triggering)
endif(MPIA_ST)

if(MPIA_TA)
	add_subdirectory(./locality_aware)
	message(STATUS "INSTALL PREFIX is : ${CMAKE_INSTALL_PREFIX}")
endif(MPIA_TA)


