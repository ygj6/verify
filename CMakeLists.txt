cmake_minimum_required(VERSION 3.2)

cmake_policy(SET CMP0074 NEW)
project(verify)

set(CMAKE_VERBOSE_MAKEFILE 1)

message("BOOST_ROOT=${BOOST_ROOT}")
message("BOOST_INCLUDEDIR=${BOOST_INCLUDEDIR}")
message("BOOST_LIBRARYDIR=${BOOST_LIBRARYDIR}")

FIND_PACKAGE (Boost REQUIRED)
message("Boost_INCLUDE_DIRS = ${Boost_INCLUDE_DIRS}")
message("Boost_LIBRARIES = ${Boost_LIBRARIES}")
FIND_PACKAGE (Boost 1.62.0 COMPONENTS chrono context system timer)
message("Boost_INCLUDE_DIRS2 = ${Boost_INCLUDE_DIRS}")
message("Boost_LIBRARIES2 = ${Boost_LIBRARIES}")

# find_package(OpenSSL REQUIRED)

# message(STATUS "OpenSSL include: ${OPENSSL_INCLUDE_DIR}")
# message(STATUS "OpenSSL lib: ${OPENSSL_LIBRARIES}")

# include_directories(${OPENSSL_INCLUDE_DIR})

# add_executable(main main.c)

# #target_link_libraries(main ${OPENSSL_LIBRARIES})

# enable_testing()
# add_test(main main)

