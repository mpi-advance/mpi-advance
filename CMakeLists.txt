cmake_minimum_required(VERSION 3.17 FATAL_ERROR) 
project(MPIAdvance VERSION 1.0.0 LANGUAGES C)

option(SPACK "system is being built using SPACK" OFF)
option(MPIA_PC "build MPIPCL shared library." ON)
option(MPIA_ST "Build MPIA Stream Triggering Library." OFF)
option(MPIA_LA "BUILD MPIA Topology Aware Libraries." OFF)
option(CUDA_SUPPORT "BUILD WITH CUDA BACKENDS" OFF)
option(HIP "BUILD WITH HIP BACKENDS" OFF)
option(CXI "BUILD WITH CXI BACKENDS" OFF)
option(HPE "BUILD WITH HPE BACKENDS" OFF)
option(BUILD_TESTS "BUILD Tests and examples" OFF)

#include_directories(./include)
message(STATUS, "MPIA_PC = ${MPIA_PC}")
message(STATUS, "MPIA_ST = ${MPIA_ST}")
message(STATUS, "MPIA_LA = ${MPIA_LA}")
message(STATUS, "CHECK")

if(NOT SPACK)
	message(STATUS, "NO SPACK DETECTED")
	#set(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/installed" CACHE PATH "install prefix" FORCE)
else()
	message(STATUS, "SPACK DETECTED")
	#set(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_BINARY_DIR}" CACHE PATH "install prefix" FORCE)
endif(NOT SPACK)

message(STATUS, "Install prefix = ${CMAKE_INSTALL_PREFIX}")

if(MPIA_PC)
	if(BUILD_TESTS)
		set(BUILD_EXAMPLES ON CACHE BOOL "BUILD_EXAMPLES" FORCE)
		set(EXAMPLES_TO_BIN ON CACHE BOOL "EXAMPLES_TO_BIN" FORCE)
		message(STATUS, "EX2BIN = ${EXAMPLES_TO_BIN}")
	endif(BUILD_TESTS)
	add_subdirectory(./MPIPCL)
endif(MPIA_PC)

if(MPIA_ST)
	if(CUDA_SUPPORT)
		set(USE_CUDA_BACKEND ON)
	endif()	
	if(HIP)
		set(USE_HIP_BACKEND ON)
	endif()	
	if(CXI)
		set(USE_CXI_BACKEND ON)
	endif()
	if(HPE)
		set(USE_HPE_BACKEND ON)
	endif()
	add_subdirectory(./stream-triggering)
endif(MPIA_ST)

if(MPIA_LA)
	if(USE_CUDA)
	    set(USE_CUDA ON)
    	endif()
	if(HIP)
		set(USE_HIP ON)
	endif()
	if(BUILD_TESTS)
		set(ENABLE_UNIT_TESTS ON)
	endif()
	add_subdirectory(./locality_aware)
endif(MPIA_LA)


#install(TARGETS locality_aware
#        EXPORT locality_awareTargets
#        DESTINATION lib)

# Configure the file MyProjectConfig.cmake.in
include(CMakePackageConfigHelpers)
configure_package_config_file(
    ${CMAKE_CURRENT_SOURCE_DIR}/cmake/MPIAdvance-config.cmake.in
    ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake
	INSTALL_DESTINATION ${PROJECT_NAME}
)

write_basic_package_version_file(
	${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config-version.cmake
	COMPATIBILITY SameMinorVersion
)

# Install the generated config file.
install(FILES 
       	${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config-version.cmake
		${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME}Config.cmake
		DESTINATION share/${PROJECT_NAME}
)

# Export the targets into a CMake package
#install(EXPORT MPIAdvanceTargets
 #       NAMESPACE MPIAdvance::
#        DESTINATION share/${PROJECT_NAME})

