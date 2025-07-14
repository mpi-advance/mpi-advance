# CMake generated Testfile for 
# Source directory: /home/aworley/MPI_advance/mpi-advance/locality_aware/src/collective/tests
# Build directory: /home/aworley/MPI_advance/mpi-advance/build/locality_aware/src/collective/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test([=[test_alltoall_Test]=] "mpirun" "-n" "16" "./test_alltoall")
set_tests_properties([=[test_alltoall_Test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/collective/tests/CMakeLists.txt;20;add_test;/home/aworley/MPI_advance/mpi-advance/locality_aware/src/collective/tests/CMakeLists.txt;0;")
add_test([=[test_alltoall_enum_Test]=] "mpirun" "-n" "16" "./test_alltoall_enum")
set_tests_properties([=[test_alltoall_enum_Test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/collective/tests/CMakeLists.txt;20;add_test;/home/aworley/MPI_advance/mpi-advance/locality_aware/src/collective/tests/CMakeLists.txt;0;")
add_test([=[test_alltoallv_Test]=] "mpirun" "-n" "16" "./test_alltoallv")
set_tests_properties([=[test_alltoallv_Test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/collective/tests/CMakeLists.txt;20;add_test;/home/aworley/MPI_advance/mpi-advance/locality_aware/src/collective/tests/CMakeLists.txt;0;")
add_test([=[test_alltoallv_enum_Test]=] "mpirun" "-n" "16" "./test_alltoallv_enum")
set_tests_properties([=[test_alltoallv_enum_Test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/collective/tests/CMakeLists.txt;20;add_test;/home/aworley/MPI_advance/mpi-advance/locality_aware/src/collective/tests/CMakeLists.txt;0;")
add_test([=[test_suitesparse_alltoallv_Test]=] "mpirun" "-n" "16" "./test_suitesparse_alltoallv")
set_tests_properties([=[test_suitesparse_alltoallv_Test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/collective/tests/CMakeLists.txt;20;add_test;/home/aworley/MPI_advance/mpi-advance/locality_aware/src/collective/tests/CMakeLists.txt;0;")
