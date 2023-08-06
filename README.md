# All about CMake

## General Note
1. In CMake C++ expressed as CXX
2. Generating a project
    ```bash
    cmake [<option>] -S <path-to-source> -B <path-to-build>
    ```

    Assuming that a CMakeLists.txt is in the root directory, we can generate a project like the following

    ```bash
    mkdir build
    cd build

    # option 1
    cmake -S .. -B .

    # option 2
    cmake ..
    ```
3. We can override value of variable built in CMake. For example
    ```bash
    set(CMAKE_CXX_STANDARD 17)
    set(CMAKE_CXX_STANDARD_RQUIRED ON)
    set(CMAKE_CXX_EXTENSIONS OFF)
    ```

# References
1. https://cmake.org/cmake/help/latest/command/add_library.html
2. https://cmake.org/cmake/help/latest/command/add_executable.html