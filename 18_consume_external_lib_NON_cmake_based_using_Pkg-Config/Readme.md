# Consuming External Library That Uses NON CMake Based Build Tool (Using Pkg-Config)

The libraries that are built based on non CMake build tool usually have Pkg-Config (.pc) files.

The files inside the packages:
1. compiled library
2. header files
3. symbolic links
4. Pkg-Config (.pc)

In this example we use GTK3 library as an external library.
We will use Pkg-Config in CMake to link the GTK3 library to the example.

## Install GTK3
1. Install with brew
    ```
    $ brew install gtk+3
    ```

2. Find the library config
    ``` bash
    $ find /usr -name "*gtk*pc"

    OUTPUT:
    /usr/local/lib/pkgconfig/gtk+-quartz-3.0.pc
    /usr/local/lib/pkgconfig/gtk+-unix-print-3.0.pc
    /usr/local/lib/pkgconfig/gtk+-3.0.pc
    /usr/local/Cellar/gtk+3/3.24.29/lib/pkgconfig/gtk+-quartz-3.0.pc
    /usr/local/Cellar/gtk+3/3.24.29/lib/pkgconfig/gtk+-unix-print-3.0.pc
    /usr/local/Cellar/gtk+3/3.24.29/lib/pkgconfig/gtk+-3.0.pc

    ```

3. Open <code>/usr/local/lib/pkgconfig/gtk+-3.0.pc</code> with nano editor. We can see the lib and include location
    ```
    prefix=/usr/local/Cellar/gtk+3/3.24.29
    libdir=${prefix}/lib
    includedir=${prefix}/include

    ....

    Libs: -L${libdir} -lgtk-3

    
    ```

    The name of lib is gtk-3 which is different from the gtk+-3.0.pc file name.

## Creating CMakeLists.txt
1. Set CMake minimum version and Project name
2. <code>find_package</code> will find and execute <code>/usr/local/share/cmake/Modules/FindPkgConfig.cmake</code>
3. <code>pkg_check_modules</code> will find the <code>.pc</code> files. The arguments are:

    <ol>
        <li>Prefix : <b>GTK3</b> </li>
        <li>The name of .pc file => <b>gtk+-3.0</b> (<code>/usr/local/lib/pkgconfig/gtk+-3.0.pc</code>)</li>
    </ol>
    <br/>
     
   if found, it will set variables : GTK3_INCLUDE_DIRS and GTK3_LIBRARIES <br/>

4. If you got any error or can not find one of package config (.pc) while building the app, just install the missing dependecy library from souce/package manager based on the OS you use. I this lab, some of dependencies of GTK+3 are.

    ### Dependency Libraries:
    xorg-macros -> util-macros
    xproto
    renderproto
    kbproto
    xextproto

    ### Repository:
    https://www.x.org/archive/individual/
    https://www.x.org/archive/individual/proto/
    https://www.x.org/archive/individual/util/

    ### Installation Step:
    https://noknow.info/it/os/install_xproto_from_source
    https://noknow.info/it/os/install_kbproto_from_source
    https://noknow.info/it/os/install_xextproto_from_source

    ### Example General Installation Step:
    ``` bash
    $ wget https://www.x.org/archive/individual/proto/xproto-7.0.31.tar.gz
    $ tar xvfz xproto-7.0.31.tar.gz
    $ cd xproto-7.0.31
    $ ./configure --prefix=/usr/local/xproto/7_0_31
    $ make
    $ make install
    ```

5. If you do step #4 because some dependencies just installed, please add Pkg-Config at the Pkg-Config search directory. There are 2 ways to add <code>Pkg-Config</code> search directory<br/>
    <ol>
        <li>CMake Variable : <code>CMAKE_PREFIX_PATH</code></li>
        <li>Environment Variable : <code>PKG_CONFIG_PATH</code></li>
    </ol>
    <br/>

   If <code>Pkg-Config</code> is not in the standard location, we can append it to search directory.
    
    #### Override

     ``` bash
     # Not recommended
     set(CMAKE_PREFIX_PATH "home/neutro/Desktop")
     ```
            
    #### Append pada CMake variable
    ```bash 
    set(CMAKE_PREFIX_PATH 
                ${CMAKE_PREFIX_PATH} "home/neutro/Desktop")
    ```
            
    or

    ```bash 
    list(APPEND CMAKE_PREFIX_PATH 
                "home/neutro/Desktop")
    ```

    #### Append to environment variable
    ```bash 
    set(ENV{PKG_CONFIG_PATH} 
                "${PKG_CONFIG_PATH}:"home/neutro/Desktop")
    ```

    #### Add to bash Profile .bashrc, contoh:
    ```bash 
    # export PKG_CONFIG_PATH
    export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
    export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/opt/zliblib/pkgconfig
    export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/xproto7_0_31/lib/pkgconfig
    export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/localutil_macros/1_19_3/share/pkgconfig
    export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/localrenderproto/0_11_1/lib/pkgconfig
    export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/kbproto1_0_7/lib/pkgconfig
    export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/localxextproto/7_3_0/lib/pkgconfig
    ```

    Location of path Pkg-Config will be showed at the installation of library or can be searched:

    ``` bash
    $ find /usr -name "*keyword*"
    ```

## Build and Run Example
1. navigate to build dir
   ``` bash
   $ cd build
   $ cmake ..
   $ make
   $ ./GTK_PC_app
   ```

# Tips
1. If found error
    ``` bash
    Could NOT find PkgConfig (missing: PKG_CONFIG_EXECUTABLE)
    ```
    just install pkg-config package
    ```bash
    brew install pkg-config
    ```

    ```bash
    sudo apt-get install pkg-config
    ```