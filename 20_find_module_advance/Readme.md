# find_path and find_library Command

## Default Paths
    1. find_path(...)
        a. /usr/include
        b. /usr/include/x86_64-linux-gnu

    2. find_library(...)
        a. /usr/lib
        b. /usr/lib/x86_64-linux-gnu

    

## Library/Header in Specific Location        
    Header: 
        ``
        abc.h
        ```
    Locations:
        ```
        /home/neutro/Downloads/abc
        /home/neutro/Downloads/abc/include
        /home/neutro/Downloads/abc/include/abc-1.14
        ```

    Format command:
        ```
        find_path(<VAR> <file-name> 
            <path1> <path2> ... 
            <suffix1>...)
        ```

    Example:
        ```
        find_path(abc_INCLUDE abc.h
            HINTS /home/neutro/Downloads/abc
            PATH_SUFFIXES include include/abc-1.14
        )
        ```

    Result:
        a. find_path 
            /home/neutro/Downloads/abc/include

        b. find_library
            /home/neutro/Downloads/abc/libabc.so
    

# Writing Own Find Module
Assuming there is no file *.pc of GTK3

1. Create FindGTK3 module on cmake/modules/FindGTK3.cmake
2. Tambahkan find_library terhadap lib GTK3 (search dari terminal )
3. Tambahkan find_path terhadap header GTK3 (search dari terminal )
4. Tambahkan juga find_library dan find_path pada dependensinya yang muncul saat build.


# TIPS
To make verbose build:
1. From CMake
    ```
    # Build your project with verbose output
    # This will allow you to see the exact commands being used.
    # And this works with Makefiles, Ninja, Visual Studio, etc.
    
    $ cmake --build build --verbose


    # to make permanent
    $ cmake -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON .
    $ make
    ```

2. From make
    ```
    $ cmake
    $ make VERBOSE=1
    ```

    Example output:
    ```
    [ 50%] Building CXX object CMakeFiles/GTK_FindModule_app.dir/main.cpp.o
    /Library/Developer/CommandLineTools/usr/bin/c++  -I/usr/local/include/gtk-3.0 -I/usr/local/include/glib-2.0 -I/usr/local/Cellar/glib/2.68.2/lib/glib-2.0/include -I/usr/local/include/pango-1.0 -I/usr/local/include/harfbuzz -I/usr/local/include/cairo -I/usr/local/include/gdk-pixbuf-2.0 -I/usr/local/include/atk-1.0 -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX10.14.sdk -MD -MT CMakeFiles/GTK_FindModule_app.dir/main.cpp.o -MF CMakeFiles/GTK_FindModule_app.dir/main.cpp.o.d -o CMakeFiles/GTK_FindModule_app.dir/main.cpp.o -c /Users/neutro/workspace/work/personal/bitbucket2021/cpp-cmake/19_find_module/main.cpp

    [100%] Linking CXX executable GTK_FindModule_app
    /usr/local/Cellar/cmake/3.20.2/bin/cmake -E cmake_link_script CMakeFiles/GTK_FindModule_app.dir/link.txt --verbose=1
    /Library/Developer/CommandLineTools/usr/bin/c++  -isysroot /Library/Developer/CommandLineTools/SDKs/MacOSX10.14.sdk -Wl,-search_paths_first -Wl,-headerpad_max_install_names CMakeFiles/GTK_FindModule_app.dir/main.cpp.o -o GTK_FindModule_app  /usr/local/lib/libgtk-3.dylib /usr/local/lib/libgio-2.0.dylib /usr/local/lib/libgobject-2.0.dylib


    ```

