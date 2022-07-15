## Compile CMake

``` bash
$ cmake

```

Jika menjalankan CMake dari path lain misal path output (ex: build)

``` bash
$ cd build
$ cmake ..

```

# Install Command

``` bash
install (FILES <file_name> DESTINATION <dir>)
install(DIRECTORY <dir> DESTINATION <dir>)
```

``` bash
install (TARGETS <file_name> DESTINATION <dir>)
```

https://cmake.org/cmake/help/v3.7/command/install.html#installing-directories

# Build and Install libraries
``` bash
$ cd build
$ cmake ..

#this will copy the lib and header to the installation path as mentioned above /usr/local/include/my_math and /usr/local/lib/my_math

$ sudo make install 
```