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
3. <code>pkg_check_modules</code> will do the following task:<br/>
        3.1. <code>pkg_check_modules</code> will find the .pc files<br/>
        3.2. The arguments : <br/>
                a. Prefix : **GTK3** <br/>
                b. The name of .pc file => **gtk+-3.0** (<code>/usr/local/lib/pkgconfig/gtk+-3.0.pc</code>)
        3.3. if found, it will set variables : GTK3_INCLUDE_DIRS and GTK3_LIBRARIES


4. Jika mendapatkan error saat tidak menemukan salah satu file package config (.pc) mem-build, cukup install library dependencynya dari source/pakage manager sesuai dengan OS yang digunakan.
Dalam contoh ini, berikut beberapa dependencies dari GTK+3 library.

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
    ```
    $ wget https://www.x.org/archive/individual/proto/xproto-7.0.31.tar.gz
    $ tar xvfz xproto-7.0.31.tar.gz
    $ cd xproto-7.0.31
    $ ./configure --prefix=/usr/local/xproto/7_0_31
    $ make
    $ make install
    ```

5. Jika melakukan step pada langkah #4 karena adannya dependency yang baru diinstall, tambahkan Pkg-Config pada lokasi search Pkg-Config directory.
    Pkg-Config search directory ada 2 cara:
        5.1 CMake Variable : CMAKE_PREFIX_PATH
        5.2 Environment Variable : PKG_CONFIG_PATH

    Jika Pkg-Config tidak pada lokasi yang tepat, maka kita dapat meng-append pada lokasi search directory diatas:
        a. Override
            set(CMAKE_PREFIX_PATH "home/neutro/Desktop") ==> NOT RECOMMEND

        b. Append pada CMake variable
            set(CMAKE_PREFIX_PATH 
                        ${CMAKE_PREFIX_PATH} "home/neutro/Desktop")

        c. Append pada CMake variable
            list(APPEND CMAKE_PREFIX_PATH 
                        "home/neutro/Desktop")

        d. Append pada environment variable
            set(ENV{PKG_CONFIG_PATH} 
                        "${PKG_CONFIG_PATH}:"home/neutro/Desktop")

        e. Menambahkan pada .bashrc, contoh:
            # export PKG_CONFIG_PATH
            export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig
            export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/opt/zlib/lib/pkgconfig
            export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/xproto/7_0_31/lib/pkgconfig
            export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/util_macros/1_19_3/share/pkgconfig
            export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/renderproto/0_11_1/lib/pkgconfig
            export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/kbproto/1_0_7/lib/pkgconfig
            export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/xextproto/7_3_0/lib/pkgconfig

    Lokasi path Pkg-Config akan muncul saat installasi library atau bisa di search:
    ```
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