cmake_minimum_required(VERSION 3.0.0)

project(MyCppProject VERSION 1.2.7 LANGUAGES C CXX)

# example overriding cmake default value
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_RQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(LIBRARY_NAME the_lib)
set(EXECUTABLE_NAME the_app)
set(MY_CUSTOM_VARIABLE neutro)

# set(CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake/")
# include(AddGitSubmodule)

# add_git_submodule(external/json)

include(FetchContent)

# fmt library
FetchContent_Declare(
    fmt
    GIT_REPOSITORY https://github.com/fmtlib/fmt.git
    GIT_TAG 10.0.0
)
FetchContent_MakeAvailable(fmt)

# spdlog library
FetchContent_Declare(
    spdlog
    GIT_REPOSITORY https://github.com/gabime/spdlog.git
    GIT_TAG v1.12.0
)
FetchContent_MakeAvailable(spdlog)

include(${CMAKE_BINARY_DIR}/conan_toolchain.cmake)

option(COMPILE_EXECUTABLE "Whether to compile the executable" ON)

add_subdirectory(config)
add_subdirectory(src)

if(COMPILE_EXECUTABLE)
message("Compiling WITH executable")
    add_subdirectory(app)
else()
    message("Compiling WITHOUT executable")
endif()




