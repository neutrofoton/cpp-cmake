# Overriding CMake Variable Value
We can overrride CMake variable through paremeter of CMake command line paremeter using -D prefix parameter.

```bash
mkdir build
cd build
cmake .. -DCOMPILE_EXECUTABLE=ON
```

# Generator

```bash
    cmake [<option>] -S <path-to-source> -B <path-to-build>
```
Assuming that a CMakeLists.txt is in the root directory, we can generate a project like the following

### Generator for GCC and Clang
```bash
cd build

# option 1
cmake -S .. -B . -G "Unix Makefiles" 

# option 2
cmake .. -G "Unix Makefiles"
```

### Generator for MSVC
```bash
cd build

# option 1
cmake -S .. -B . -G "Visual Studio 16 2019" 

# option 2
cmake .. -G "Visual Studio 16 2019"

```

# Build Type
By default the standard type is in most cases the debug type. If we want to build in release mode

```bash
cd build
cmake -DCMAKE_BUILD_TYPE=Release ..
```

# Config File (Pass CMake Variable to C++ Code)
We can call variable value of defined variable of CMake in C++ code. To do that just create a C++ file  with extension <code>*.in</code>, for example <code>version.hpp.in</code>. The cmake will generate a header file called <code>version.hpp</code>. The value that will be replaced by CMake defined in the header file. 

```cpp
#pragma once

#include <cstdint>
#include <string_view>

static constexpr std::string_view project_name = "@PROJECT_NAME@";
static constexpr std::string_view project_version = "@PROJECT_VERSION@";

static constexpr std::int32_t project_version_major{@PROJECT_VERSION_MAJOR@};
static constexpr std::int32_t project_version_minor{@PROJECT_VERSION_MINOR@};
static constexpr std::int32_t project_version_patch{@PROJECT_VERSION_PATCH@};

static constexpr std::string_view project_custom_variable = "@MY_CUSTOM_VARIABLE@";
```

Then we can call the variables in our code just like standard C++ variables.
