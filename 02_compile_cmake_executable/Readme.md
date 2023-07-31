## CMake installation
For ubuntu
``` bash
sudo apt install cmake
# or
sudo snap install cmake
```

For macos
``` bash
brew install cmake
```

## CMake Version
```
cmake --version
```

## Compile CMake

Running cmake command
``` bash
$ cmake
```

Running cmake command with specified current directory
``` bash
$ cmake .
```

Running cmake command from other directory. For example path output (ex: build)
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