# find_path and find_library Command

## Default Paths
The <code>find_path(...)</code>
- <code>/usr/include</code>
- <code>usr/include/x86_64-linux-gnu</code>

The <code>find_library(...)</code>
- <code>/usr/lib</code>
- <code>/usr/lib/x86_64-linux-gnu</code>    

## Library/Header in Specific Location        
Header: 
```bash
abc.h
```

Locations:
``` bash
/home/neutro/Downloads/abc
/home/neutro/Downloads/abc/include
/home/neutro/Downloads/abc/include/abc-1.14
```

### find_path
Format command:
``` bash
find_path(<VAR> <file-name> 
            <path1> <path2> ... 
            <suffix1>...)
```

Example:
``` bash
find_path(abc_INCLUDE abc.h
    HINTS /home/neutro/Downloads/abc
    PATH_SUFFIXES include include/abc-1.14
)
```

Result:

```
/home/neutro/Downloads/abc/include
```

### find_library
- Library file  : <code>libabs.so</code>
- Location      : <code>/home/neutro/Downloads/abc</code>

Format Command
```bash
find_library(<VAR> <lib-name> <path1><path2> ...)
```

Example
```bash
find_library(abc_LIBRARY abc HINTS /home/neutro/Downloads/abc)
```

Result:
```
VAR = abc_LIBRARY = /home/neutro/Downloads/abc/libabc.so
lib-name = abc
```

    

# Writing Own Find Module
Assuming there is no file *.pc of GTK3

1. Create FindGTK3 module on <code>cmake/modules/FindGTK3.cmake</code>
2. Tambahkan <code>find_library</code> terhadap **lib GTK3** (search dari terminal )
3. Tambahkan <code>find_path</code> terhadap **header GTK3** (search dari terminal )
4. Tambahkan juga <code>find_library</code> dan <code>find_path</code> pada dependensinya yang muncul saat build.


# TIPS
To make verbose build:
1. From CMake
    ``` bash
    # Build your project with verbose output
    # This will allow you to see the exact commands being used.
    # And this works with Makefiles, Ninja, Visual Studio, etc.
    
    $ cmake --build build --verbose
    ```
    
    ``` bash
    # to make permanent
    $ cmake -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON .
    $ make
    ```

2. From make
    ``` bash
    $ cmake
    $ make VERBOSE=1
    ```

    Example output:
    ``` bash
    [ 50%] Building CXX object CMakeFiles/GTK_FindModule_app.dir/main.cpp.o
    /Library/Developer/CommandLineTools/usr/bin/c++  -I/usr/local/include/gtk-3.0 -I/usr/local/include/glib-2.0 -I/usr/local/Cellar/glib/2.68.2/lib/glib-2.0/include -I/usr/local/include/pango-1.0 -I/usr/local/include/harfbuzz -I/usr/local/include/cairo -I/usr/local/include/gdk-pixbuf-2.0 -I/usr/local/include/atk-1.0 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX10.14.sdk -MD -MT CMakeFiles/GTK_FindModule_app.dir/main.cpp.o -MF CMakeFiles/GTK_FindModule_app.dir/main.cpp.o.d -o CMakeFiles/GTK_FindModule_app.dir/main.cpp.o -c /Users/neutro/workspace/work/personal/bitbucket2021/cpp-cmake/19_find_module/main.cpp

    [100%] Linking CXX executable GTK_FindModule_app
    /usr/local/Cellar/cmake/3.20.2/bin/cmake -E cmake_link_script CMakeFiles/GTK_FindModule_app.dir/link.txt --verbose=1
    /Library/Developer/CommandLineTools/usr/bin/c++  -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX10.14.sdk -Wl,-search_paths_first -Wl,-headerpad_max_install_names CMakeFiles/GTK_FindModule_app.dir/main.cpp.o -o GTK_FindModule_app  /usr/local/lib/libgtk-3.dylib /usr/local/lib/libgio-2.0.dylib /usr/local/lib/libgobject-2.0.dylib


    ```

