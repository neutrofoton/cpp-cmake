## Compile CMake

``` bash
$ cmake

```

Jika menjalankan CMake dari path lain misal path output (ex: bin)

``` bash
$ cd build
$ cmake ..

```

## CMAKE_GENERATOR
CMAKE_GENERATOR tells about the build system used to compile C++ project. 

By default we used Make build system. It can be verified in CMakeCache.txt file.
``` text
//Name of generator.
CMAKE_GENERATOR:INTERNAL=Unix Makefiles
```
To see build system we have, run command:
``` bash
$ cmake --help

Output:
The following generators are available on this platform (* marks default):
* Unix Makefiles               = Generates standard UNIX makefiles.
  Ninja                        = Generates build.ninja files.
  Ninja Multi-Config           = Generates build-<Config>.ninja files.
  Xcode                        = Generate Xcode project files.
  CodeBlocks - Ninja           = Generates CodeBlocks project files.
  CodeBlocks - Unix Makefiles  = Generates CodeBlocks project files.
  CodeLite - Ninja             = Generates CodeLite project files.
  CodeLite - Unix Makefiles    = Generates CodeLite project files.
  Eclipse CDT4 - Ninja         = Generates Eclipse CDT 4.0 project files.
  Eclipse CDT4 - Unix Makefiles= Generates Eclipse CDT 4.0 project files.
  Kate - Ninja                 = Generates Kate project files.
  Kate - Unix Makefiles        = Generates Kate project files.
  Sublime Text 2 - Ninja       = Generates Sublime Text 2 project files.
  Sublime Text 2 - Unix Makefiles
                               = Generates Sublime Text 2 project files.

```

To compile with CMAKE_GENERATOR Ninja

``` bash
$ brew install ninja-build
$ cd build
$ cmake -DCMAKE_GENERATOR=Ninja ..
$ ninja
$ ./calculator
```

- Tanda ".." karena kita menjalankan command (pwd) dalam build subdirectory
- Run ninja to generate executable