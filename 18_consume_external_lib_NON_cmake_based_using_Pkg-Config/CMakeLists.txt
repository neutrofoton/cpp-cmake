cmake_minimum_required(VERSION 3.0.0)

project(GTK_PC)

# https://cmake.org/cmake/help/latest/module/FindPkgConfig.html

# find and execute /usr/local/share/cmake/Modules/FindPkgConfig.cmake
find_package(PkgConfig REQUIRED)

#[[
    1. pkg_check_modules will find the .pc files
    2. The arguments : 
        a. Prefix : GTK3
        b. The name of .pc file => gtk+-3.0 
            (
                /usr/local/lib/pkgconfig/gtk+-3.0.pc, 
                /usr/local/Cellar/gtk+3/3.24.29/lib/pkgconfig/gtk+-3.0.pc
            )
    3. if found, it will set variables : GTK3_INCLUDE_DIRS and GTK3_LIBRARIES
]]#
pkg_check_modules(GTK3 REQUIRED gtk+-3.0)

add_executable(${PROJECT_NAME}_app  main.cpp)

message("GTK3_LIBRARIES: "${GTK3_LIBRARIES})

target_include_directories(${PROJECT_NAME}_app  PRIVATE  ${GTK3_INCLUDE_DIRS})
target_link_libraries(${PROJECT_NAME}_app  PRIVATE  ${GTK3_LIBRARIES})

# /usr/local/Cellar/gtk+3/3.24.29/lib/pkgconfig/gtk+-3.0.pc