# Installing and Exporting Library
``` bash
find_package(ABC)
```

maka akan mencari ABC-config.cmake di folder: /usr/local/lib/ABC
to do that we need to use export keyword and specify filename (my_export)

``` bash
install(TARGETS my_math EXPORT my_export DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/my_math)
```

we also need to install the export file (my_export).

We also need to add generator expression in the target_include_directories
``` bash
target_include_directories( my_math PUBLIC
    $<INSTALL_INTERFACE:include>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)
```

Then build and install
``` bash
$ cd build
$ cmake ..
$ sudo make install
```

# Consuming Library