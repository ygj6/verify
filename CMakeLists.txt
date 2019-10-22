cmake_minimum_required(VERSION 3.2)

project(verify)

find_package(OpenSSL REQUIRED)

message(STATUS "OpenSSL include: ${OPENSSL_INCLUDE_DIR}")
message(STATUS "OpenSSL lib: ${OPENSSL_LIBRARIES}")

include_directories(${OPENSSL_INCLUDE_DIR})

add_executable(main main.c)

target_link_libraries(main ${OPENSSL_LIBRARIES})

enable_testing()
add_test(main main)

