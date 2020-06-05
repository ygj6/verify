cmake_minimum_required(VERSION 3.2)

cmake_policy(SET CMP0074 NEW)
project(verify)

set(CMAKE_VERBOSE_MAKEFILE 1)

FIND_PACKAGE (Boost REQUIRED)
message("BOOST_INCLUDES = ${BOOST_INCLUDES}")
message("Boost_INCLUDE_DIRS = ${Boost_INCLUDE_DIRS}")
message("BOOST_LIBRARIES = ${BOOST_LIBRARIES}")
FIND_PACKAGE (Boost REQUIRED COMPONENTS chrono context system timer)

# find_package(OpenSSL REQUIRED)

# message(STATUS "OpenSSL include: ${OPENSSL_INCLUDE_DIR}")
# message(STATUS "OpenSSL lib: ${OPENSSL_LIBRARIES}")

# include_directories(${OPENSSL_INCLUDE_DIR})

# add_executable(main main.c)

# #target_link_libraries(main ${OPENSSL_LIBRARIES})

# enable_testing()
# add_test(main main)

