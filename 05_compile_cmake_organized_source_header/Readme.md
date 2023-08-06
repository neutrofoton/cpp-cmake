
   <sub>*Table 1: Matrix usage of PUBLIC, INTERFACE, PRIVATE*</sub>

   | Question        | Answer |Answer | Answer | 
   | :---        |     :---:      |    :---: |  :---: | 
   | Does 'my_math' need the directory?      | Yes |No |Yes| 
   | Does the other targets, depending upon 'my_math' are going to need this include directory?      | Yes |Yes |No| 
   |       | **_PUBLIC_** |**_INTERFACE_** |**_PRIVATE_**| 
   


## target_include_directories
if we want to include header in the current directory of CMakeLists.txt

``` bash
target_include_directories(LIB_NAME PUBLIC "./")
```

## Running The Example
1. Create a build directory
    ```bash
    mkdir build
    cd build
    ```

2. Run CMake
    ```bash
    cmake ..
    ```

    The step 2 will generate Makefile and other depedecies in the current directory (build)

3. Run make command
    ```bash
    make
    ```
    
    The step 3 will generate executable file.

4. Run the executable to verify it.
    ```bash
    ./calculator
    ```