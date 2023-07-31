When we need to add an external project as the dependency, we will use command <code>find_package</code> in <code>CMakeLists.txt</code> to let CMake know where the header files and libraries are located, such that they can be found and linked properly later on. 

``` bash
# will find out ABC-config.cmake di folder: /usr/local/lib/ABC
find_package(ABC)
```

In order our libray can be searched and used publicly by others, we need to export the lib and config.

# Steps of Exporting Library
1. Change the <code>target_include_directories</code>
    ``` bash
    # target_include_directories(my_math PUBLIC include)
    target_include_directories( my_math PUBLIC
        $<INSTALL_INTERFACE:include>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    )
    ```
2. Install headers
    ``` bash
    # install files mention secara explisit. Hasil copy di /usr/local/include/my_math
    install(FILES 
        ${CMAKE_CURRENT_SOURCE_DIR}/include/addition.h 
        ${CMAKE_CURRENT_SOURCE_DIR}/include/division.h  
        DESTINATION 
        ${CMAKE_INSTALL_PREFIX}/include/my_math
    )
    ```

3. Change the install target using an EXPORT keyword
    ```bash
    # install(TARGETS my_math DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/my_math)
    install(TARGETS my_math EXPORT my_export DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/my_math)
    ```

4. Install the config
    ```bash
    # install export file and specify FILE option to my_math-config.cmake
    install(
        EXPORT my_export
        FILE my_math-config.cmake
        DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/my_math
    )
    ```


Finally, build and install
``` bash
$ cd build
$ cmake ..
$ sudo make install
```

# Step Consuming Library

1. Create find package
    ``` bash
    find_package(my_math)
    ```

    <sub>*Table: Mode of find_package()*</sub>

   | Mode           | Command                       | Will Looking for       | 
   | :---           |     :---:                     |    :---:              |
   | Module Mode    | find_package(ABC **MODULE**)      | *FindABC.cmake*          |
   | Config Mode    | find_package(ABC **CONFIG**)      |*ABC-config.cmake*          |
   

2. Referencing the libraries normally in code.

# General Step of Using External Library
For example the libarary name is called <code>XYZ</code>. The Library file name is <code>libXYZ.a</code> or <code>libXYZ.so</code>

1. Dowload the souce code (from github or official website)
2. run
    ```bash
    cmake
    make
    sudo make install
    ```
3. Make sure a <code>XYZ-config.cmake</code> is in the installed location
4. Use <code>find_package(XYZ)