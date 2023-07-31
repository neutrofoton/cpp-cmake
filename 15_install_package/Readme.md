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

    The output is:

    ``` bash
    [ 14%] Building CXX object my_print_dir/CMakeFiles/my_print.dir/src/print_result.cpp.o
    [ 28%] Linking CXX static library libmy_print.a
    [ 28%] Built target my_print
    [ 42%] Building CXX object my_math_dir/CMakeFiles/my_math.dir/src/addition.cpp.o
    [ 57%] Building CXX object my_math_dir/CMakeFiles/my_math.dir/src/division.cpp.o
    [ 71%] Linking CXX static library libmy_math.a
    [ 71%] Built target my_math
    [ 85%] Building CXX object CMakeFiles/calculator.dir/main.cpp.o
    [100%] Linking CXX executable calculator
    [100%] Built target calculator
    Install the project...
    -- Install configuration: ""
    -- Installing: /usr/local/include/my_math/addition.h
    -- Installing: /usr/local/include/my_math/division.h
    -- Installing: /usr/local/lib/my_math/libmy_math.a
    ```

3. To test the installation run well, we can copy the <code>calculator</code> executable file to othe directory (~/Download/calculator). Then run it from there. It shoud be run well.