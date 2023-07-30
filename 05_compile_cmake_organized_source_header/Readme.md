## Compile CMake

``` bash
$ cmake

```

Jika menjalankan CMake dari path lain misal path output (ex: bin)

``` bash
$ cd build
$ cmake ..

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