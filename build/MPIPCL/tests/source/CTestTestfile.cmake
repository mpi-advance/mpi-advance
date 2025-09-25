# CMake generated Testfile for 
# Source directory: /home/apworley/mpiadvanced/meta/mpi-advance/MPIPCL/tests/source
# Build directory: /home/apworley/mpiadvanced/meta/mpi-advance/build/MPIPCL/tests/source
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(mpipcl_test_1 "mpirun" "-n" "2" "MPIPCL_CTest_1" "10" "10")
set_tests_properties(mpipcl_test_1 PROPERTIES  PASS_REGULAR_EXPRESSION "sum = 55.000000" _BACKTRACE_TRIPLES "/home/apworley/mpiadvanced/meta/mpi-advance/MPIPCL/tests/source/CMakeLists.txt;65;add_test;/home/apworley/mpiadvanced/meta/mpi-advance/MPIPCL/tests/source/CMakeLists.txt;0;")
add_test(mpipcl_test_2 "mpirun" "-n" "2" "MPIPCL_CTest_2" "10" "10")
set_tests_properties(mpipcl_test_2 PROPERTIES  PASS_REGULAR_EXPRESSION "sum = 55.000000" _BACKTRACE_TRIPLES "/home/apworley/mpiadvanced/meta/mpi-advance/MPIPCL/tests/source/CMakeLists.txt;68;add_test;/home/apworley/mpiadvanced/meta/mpi-advance/MPIPCL/tests/source/CMakeLists.txt;0;")
add_test(mpipcl_test_3 "mpirun" "-n" "5" "MPIPCL_CTest_3" "100" "100")
set_tests_properties(mpipcl_test_3 PROPERTIES  PASS_REGULAR_EXPRESSION "sum = 5050.000000" _BACKTRACE_TRIPLES "/home/apworley/mpiadvanced/meta/mpi-advance/MPIPCL/tests/source/CMakeLists.txt;71;add_test;/home/apworley/mpiadvanced/meta/mpi-advance/MPIPCL/tests/source/CMakeLists.txt;0;")
add_test(mpipcl_test_4 "mpirun" "-n" "5" "MPIPCL_CTest_4" "5" "10")
set_tests_properties(mpipcl_test_4 PROPERTIES  PASS_REGULAR_EXPRESSION "sum = 55.000000" _BACKTRACE_TRIPLES "/home/apworley/mpiadvanced/meta/mpi-advance/MPIPCL/tests/source/CMakeLists.txt;74;add_test;/home/apworley/mpiadvanced/meta/mpi-advance/MPIPCL/tests/source/CMakeLists.txt;0;")
add_test(mpipcl_test_5 "mpirun" "-n" "2" "MPIPCL_CTest_5" "10" "10")
set_tests_properties(mpipcl_test_5 PROPERTIES  PASS_REGULAR_EXPRESSION "sum = 55.000000" _BACKTRACE_TRIPLES "/home/apworley/mpiadvanced/meta/mpi-advance/MPIPCL/tests/source/CMakeLists.txt;77;add_test;/home/apworley/mpiadvanced/meta/mpi-advance/MPIPCL/tests/source/CMakeLists.txt;0;")
add_test(mpipcl_test_6_0 "mpirun" "-n" "2" "MPIPCL_CTest_6" "10" "10" "0")
set_tests_properties(mpipcl_test_6_0 PROPERTIES  PASS_REGULAR_EXPRESSION "sum = 55.000000" _BACKTRACE_TRIPLES "/home/apworley/mpiadvanced/meta/mpi-advance/MPIPCL/tests/source/CMakeLists.txt;80;add_test;/home/apworley/mpiadvanced/meta/mpi-advance/MPIPCL/tests/source/CMakeLists.txt;0;")
add_test(mpipcl_test_6_1 "mpirun" "-n" "2" "MPIPCL_CTest_6" "10" "10" "1")
set_tests_properties(mpipcl_test_6_1 PROPERTIES  PASS_REGULAR_EXPRESSION "sum = 55.000000" _BACKTRACE_TRIPLES "/home/apworley/mpiadvanced/meta/mpi-advance/MPIPCL/tests/source/CMakeLists.txt;83;add_test;/home/apworley/mpiadvanced/meta/mpi-advance/MPIPCL/tests/source/CMakeLists.txt;0;")
add_test(mpipcl_test_6_2 "mpirun" "-n" "2" "MPIPCL_CTest_6" "10" "10" "2")
set_tests_properties(mpipcl_test_6_2 PROPERTIES  PASS_REGULAR_EXPRESSION "sum = 55.000000" _BACKTRACE_TRIPLES "/home/apworley/mpiadvanced/meta/mpi-advance/MPIPCL/tests/source/CMakeLists.txt;86;add_test;/home/apworley/mpiadvanced/meta/mpi-advance/MPIPCL/tests/source/CMakeLists.txt;0;")
add_test(mpipcl_test_6_3 "mpirun" "-n" "2" "MPIPCL_CTest_6" "10" "10" "3")
set_tests_properties(mpipcl_test_6_3 PROPERTIES  PASS_REGULAR_EXPRESSION "sum = 55.000000" _BACKTRACE_TRIPLES "/home/apworley/mpiadvanced/meta/mpi-advance/MPIPCL/tests/source/CMakeLists.txt;89;add_test;/home/apworley/mpiadvanced/meta/mpi-advance/MPIPCL/tests/source/CMakeLists.txt;0;")
add_test(mpipcl_test_7 "mpirun" "-n" "2" "MPIPCL_CTest_7" "10" "60")
set_tests_properties(mpipcl_test_7 PROPERTIES  PASS_REGULAR_EXPRESSION "sum = 1830.000000" _BACKTRACE_TRIPLES "/home/apworley/mpiadvanced/meta/mpi-advance/MPIPCL/tests/source/CMakeLists.txt;92;add_test;/home/apworley/mpiadvanced/meta/mpi-advance/MPIPCL/tests/source/CMakeLists.txt;0;")
add_test(mpipcl_test_8 "mpirun" "-n" "2" "MPIPCL_CTest_8" "10" "10")
set_tests_properties(mpipcl_test_8 PROPERTIES  _BACKTRACE_TRIPLES "/home/apworley/mpiadvanced/meta/mpi-advance/MPIPCL/tests/source/CMakeLists.txt;95;add_test;/home/apworley/mpiadvanced/meta/mpi-advance/MPIPCL/tests/source/CMakeLists.txt;0;")
add_test(mpipcl_test_9 "mpirun" "-n" "2" "MPIPCL_CTest_9" "10" "10")
set_tests_properties(mpipcl_test_9 PROPERTIES  _BACKTRACE_TRIPLES "/home/apworley/mpiadvanced/meta/mpi-advance/MPIPCL/tests/source/CMakeLists.txt;97;add_test;/home/apworley/mpiadvanced/meta/mpi-advance/MPIPCL/tests/source/CMakeLists.txt;0;")
