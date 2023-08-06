# All about CMake

## General Note
1. In CMake C++ expressed as CXX
2. We can override value of variable built in CMake. For example
    ```bash
    set(CMAKE_CXX_STANDARD 17)
    set(CMAKE_CXX_STANDARD_RQUIRED ON)
    set(CMAKE_CXX_EXTENSIONS OFF)
    ```

# Libray Types
A library is a binary that contains information about code. It can not be executed on its own.

### Shared Library
Shared libraries reduce the amount of code that's duplicated in each program that makes use of it, keeping the binary small. However, Shared library has additional cost for the execution.

```bash
add_library(${LIBRARY_NAME} SHARED hello.cc)    
```

   <sub>*Shared Library File Extensions*</sub>

   | Operating System           | Extension |
   | :---               |     :---:    |
   | Linux  | *.so     |
   | MacOS  | *.dylib     |
   | Windows  | *.dll    |

### Static Library
The Linux and MacOS has the same extension for static library. Static library increase the binary size of its consumer. We don't need to carry along the library that's being used. Since the code is connected at compile time, thus no additional runtime loading cost.

```bash
add_library(${LIBRARY_NAME} STATIC hello.cc)    
```

  <sub>*Static Library File Extensions*</sub>

   | Operating System           | Extension |
   | :---               |     :---:    |
   | Linux  | *.a     |
   | MacOS  | *.a     |
   | Windows  | *.lib    |



# References
1. https://cmake.org/cmake/help/latest/command/add_library.html
2. https://cmake.org/cmake/help/latest/command/add_executable.html