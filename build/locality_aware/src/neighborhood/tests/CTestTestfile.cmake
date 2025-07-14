# CMake generated Testfile for 
# Source directory: /home/aworley/MPI_advance/mpi-advance/locality_aware/src/neighborhood/tests
# Build directory: /home/aworley/MPI_advance/mpi-advance/build/locality_aware/src/neighborhood/tests
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test([=[test_neighbor_alltoallv_init_Test]=] "mpirun" "-n" "16" "./test_neighbor_alltoallv_init")
set_tests_properties([=[test_neighbor_alltoallv_init_Test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/neighborhood/tests/CMakeLists.txt;20;add_test;/home/aworley/MPI_advance/mpi-advance/locality_aware/src/neighborhood/tests/CMakeLists.txt;0;")
add_test([=[test_neighbor_reorder_Test]=] "mpirun" "-n" "16" "./test_neighbor_reorder")
set_tests_properties([=[test_neighbor_reorder_Test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/neighborhood/tests/CMakeLists.txt;20;add_test;/home/aworley/MPI_advance/mpi-advance/locality_aware/src/neighborhood/tests/CMakeLists.txt;0;")
add_test([=[test_neighbor_topo_alltoallv_init_Test]=] "mpirun" "-n" "16" "./test_neighbor_topo_alltoallv_init")
set_tests_properties([=[test_neighbor_topo_alltoallv_init_Test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/neighborhood/tests/CMakeLists.txt;20;add_test;/home/aworley/MPI_advance/mpi-advance/locality_aware/src/neighborhood/tests/CMakeLists.txt;0;")
add_test([=[test_suitesparse_alltoall_crs_Test]=] "mpirun" "-n" "16" "./test_suitesparse_alltoall_crs")
set_tests_properties([=[test_suitesparse_alltoall_crs_Test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/neighborhood/tests/CMakeLists.txt;20;add_test;/home/aworley/MPI_advance/mpi-advance/locality_aware/src/neighborhood/tests/CMakeLists.txt;0;")
add_test([=[test_suitesparse_alltoallv_crs_Test]=] "mpirun" "-n" "16" "./test_suitesparse_alltoallv_crs")
set_tests_properties([=[test_suitesparse_alltoallv_crs_Test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/neighborhood/tests/CMakeLists.txt;20;add_test;/home/aworley/MPI_advance/mpi-advance/locality_aware/src/neighborhood/tests/CMakeLists.txt;0;")
add_test([=[test_suitesparse_neighbor_alltoallv_Test]=] "mpirun" "-n" "16" "./test_suitesparse_neighbor_alltoallv")
set_tests_properties([=[test_suitesparse_neighbor_alltoallv_Test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/neighborhood/tests/CMakeLists.txt;20;add_test;/home/aworley/MPI_advance/mpi-advance/locality_aware/src/neighborhood/tests/CMakeLists.txt;0;")
add_test([=[test_suitesparse_neighbor_alltoallv_enum_Test]=] "mpirun" "-n" "16" "./test_suitesparse_neighbor_alltoallv_enum")
set_tests_properties([=[test_suitesparse_neighbor_alltoallv_enum_Test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/neighborhood/tests/CMakeLists.txt;20;add_test;/home/aworley/MPI_advance/mpi-advance/locality_aware/src/neighborhood/tests/CMakeLists.txt;0;")
add_test([=[test_suitesparse_neighbor_alltoallv_init_Test]=] "mpirun" "-n" "16" "./test_suitesparse_neighbor_alltoallv_init")
set_tests_properties([=[test_suitesparse_neighbor_alltoallv_init_Test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/neighborhood/tests/CMakeLists.txt;20;add_test;/home/aworley/MPI_advance/mpi-advance/locality_aware/src/neighborhood/tests/CMakeLists.txt;0;")
add_test([=[test_suitesparse_neighbor_reorder_Test]=] "mpirun" "-n" "16" "./test_suitesparse_neighbor_reorder")
set_tests_properties([=[test_suitesparse_neighbor_reorder_Test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/neighborhood/tests/CMakeLists.txt;20;add_test;/home/aworley/MPI_advance/mpi-advance/locality_aware/src/neighborhood/tests/CMakeLists.txt;0;")
add_test([=[test_suitesparse_neighbor_topo_alltoallv_init_Test]=] "mpirun" "-n" "16" "./test_suitesparse_neighbor_topo_alltoallv_init")
set_tests_properties([=[test_suitesparse_neighbor_topo_alltoallv_init_Test]=] PROPERTIES  _BACKTRACE_TRIPLES "/home/aworley/MPI_advance/mpi-advance/locality_aware/src/neighborhood/tests/CMakeLists.txt;20;add_test;/home/aworley/MPI_advance/mpi-advance/locality_aware/src/neighborhood/tests/CMakeLists.txt;0;")
