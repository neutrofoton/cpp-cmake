cmake_minimum_required(VERSION 3.0.0...3.9.6)

project(Calculator_Project VERSION 1.0.0 LANGUAGES C CXX)

add_executable(
    calculator
    main.cpp
    addition.cpp
    division.cpp
    print_result.cpp
)