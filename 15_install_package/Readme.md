# Install Command
The following syntaxt is defined in the <code>CMakeList.txt</code> which tell us where we will copy the header and compiled lib in the operating system.

``` bash
# install header files
install (FILES <file_name> DESTINATION <dir>)
install(DIRECTORY <dir> DESTINATION <dir>)
```

``` bash
# install libs
install (TARGETS <file_name> DESTINATION <dir>)
```

https://cmake.org/cmake/help/v3.7/command/install.html#installing-directories

# Build and Install libraries
1. Run cmake command
    ``` bash
    $ cd build
    $ cmake ..
    ```

2. Run install command. The following command will copy the lib and header to the installation path as mentioned above <code>/usr/local/include/my_math</code> and <code>/usr/local/lib/my_math</code>.

    ``` bash
    $ sudo make install 
    ```