cmake_minimum_required (VERSION 3.8)

project(TestConan CXX)
set(CMAKE_CXX_STANDARD 11)

include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
set(CONAN_DISABLE_CHECK_COMPILER True)
conan_basic_setup()

add_executable(testConan test_conan.cpp)
target_link_libraries(testConan ${CONAN_LIBS})