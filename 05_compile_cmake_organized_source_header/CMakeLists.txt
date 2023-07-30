# cmake_minimum_required(VERSION 3.0.0)
cmake_minimum_required(VERSION 3.0.0...3.9.6)

project(Calculator_Project VERSION 1.0.0)

add_subdirectory(my_math_dir)
add_subdirectory(my_print_dir)

add_executable(calculator
    main.cpp
)

# linking libraries to add_executable
# target_link_libraries(calculator my_math my_print)
# target_link_libraries(calculator PRIVATE my_math my_print)
target_link_libraries(calculator PUBLIC my_math my_print)