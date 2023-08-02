# Consuming External Library That Uses NON CMake Based Build Tool (Using Pkg-Config)

The libraries that are built based on non CMake build tool usually have Pkg-Config (.pc) file.
The file contains information of:
1. compiled library
2. header files
3. symbolic links
4. Pkg-Config (.pc)

If we can not find these file informations, then we can install <code>lib**xyx**</code>, <code>lib**xyx**-dev</code> or <code>lib**xyx**-devel</code>

In this example we use GTK3 library as an external library.
We will use Pkg-Config in CMake to link the GTK3 library to the example.

## Install GTK3
1. Install with brew
    ```
    # macos
    brew install gtk+3
    ```

    ```bash
    # ubuntu
    sudo apt install libgtk-3-dev -y
    ```

2. Find the library config
    ``` bash
    $ find /usr -name "*gtk*pc"
    ```

    ```bash
    # macOS output:
    /usr/local/lib/pkgconfig/gtk+-quartz-3.0.pc
    /usr/local/lib/pkgconfig/gtk+-unix-print-3.0.pc
    /usr/local/lib/pkgconfig/gtk+-3.0.pc
    /usr/local/Cellar/gtk+3/3.24.29/lib/pkgconfig/gtk+-quartz-3.0.pc
    /usr/local/Cellar/gtk+3/3.24.29/lib/pkgconfig/gtk+-unix-print-3.0.pc
    /usr/local/Cellar/gtk+3/3.24.29/lib/pkgconfig/gtk+-3.0.pc
    ```
    
    ```bash
    # ubuntu output:
    /usr/lib/x86_64-linux-gnu/pkgconfig/gtk+-x11-3.0.pc
    /usr/lib/x86_64-linux-gnu/pkgconfig/gtk+-wayland-3.0.pc
    /usr/lib/x86_64-linux-gnu/pkgconfig/gtk+-3.0.pc
    /usr/lib/x86_64-linux-gnu/pkgconfig/gtk+-unix-print-3.0.pc
    /usr/lib/x86_64-linux-gnu/pkgconfig/gtk+-broadway-3.0.pc
    ```
    

3. Open <code>/usr/local/lib/pkgconfig/gtk+-3.0.pc</code> or <code>/usr/lib/x86_64-linux-gnu/pkgconfig/gtk+-3.0.pc</code> with text editor. We can see the lib and include location

    
    ``` bash
    # macOS

    prefix=/usr/local/Cellar/gtk+3/3.24.29
    libdir=${prefix}/lib
    includedir=${prefix}/include

    ....

    Libs: -L${libdir} -lgtk-3
    ```

    ```bash
    # ubuntu

    prefix=/usr
    exec_prefix=${prefix}
    libdir=/usr/lib/x86_64-linux-gnu
    includedir=${prefix}/include
    targets=x11 broadway wayland

    gtk_binary_version=3.0.0
    gtk_host=x86_64-pc-linux-gnu

    Name: GTK+
    Description: GTK+ Graphical UI Library
    Version: 3.24.33
    Requires: gdk-3.0 atk >= 2.32.0 cairo >= 1.14.0 cairo-gobject >= 1.14.0 gdk-pixbuf-2.>
    Requires.private: atk atk-bridge-2.0 wayland-client >= 1.14.91 xkbcommon >= 0.2.0 way>
    Libs: -L${libdir} -lgtk-3
    Cflags: -I${includedir}/gtk-3.0
    ```

    The name of lib is <code>gtk-3</code> which is different from the <code>gtk+-3.0.pc</code> file name.

## Creating CMakeLists.txt
1. Set CMake minimum version and Project name
2. <code>find_package</code> will find and execute <code>/usr/local/share/cmake/Modules/FindPkgConfig.cmake</code>
3. <code>pkg_check_modules</code> will find the <code>.pc</code> files. The arguments are:

    <ol>
        <li>Prefix : <b>GTK3</b> </li>
        <li>The name of .pc file => <b>gtk+-3.0</b> (<code>/usr/local/lib/pkgconfig/gtk+-3.0.pc</code>)</li>
    </ol>
    <br/>
     
   If found, it will set variables : **GTK3**_INCLUDE_DIRS and **GTK3**_LIBRARIES <br/>. 
   
   The prefix/variable name (**GTK3**) can be replaced with any varibale for example **XYZ**. Thus, it will set variables : **XYZ**_INCLUDE_DIRS and **XYZ**_LIBRARIES

4. In this lab the location of <code> *.pc</code> file in standard location <code>/usr/lib/x86_64-linux-gnu/pkgconfig/gtk+-3.0.pc</code>. Since it is in standard location, the PkgConfig can easily find it. If the <code> *.pc</code> not in standard location, we should tell the PkgConfig by register in one of the following way.
    - CMake variable : CMAKE_PREFIX_PATH
    - Environment variable : PKG_CONFIG_PATH
   It is recommended to append to the search directory instead of replace it.

    ``` bash
     # Not recommended
     set(CMAKE_PREFIX_PATH "home/neutro/Desktop")
     ```

    ```bash 
    # append to the CMake variable
    set(CMAKE_PREFIX_PATH 
                ${CMAKE_PREFIX_PATH} "home/neutro/Desktop")

    list(APPEND CMAKE_PREFIX_PATH 
                "home/neutro/Desktop")
    ```
    
    ``` bash
    # append to the environment variable
    set(ENV{PKG_CONFIG_PATH} 
                "${PKG_CONFIG_PATH}:"home/neutro/Desktop")
    ```
     
    ```bash 
    # export PKG_CONFIG_PATH, add to bash Profile .bashrc,
    export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
    export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/opt/zliblib/pkgconfig
    export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/xproto7_0_31/lib/pkgconfig
    export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/localutil_macros/1_19_3/share/pkgconfig
    export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/localrenderproto/0_11_1/lib/pkgconfig
    export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/kbproto1_0_7/lib/pkgconfig
    export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/localxextproto/7_3_0/lib/pkgconfig
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

2. If you got any error or can not find one of package config (.pc) while building the app, just install the missing dependecy library from souce/package manager based on the OS you use. I this lab, some of dependencies of GTK+3 are.

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