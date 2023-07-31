# Consuming External Library That Uses CMake Based Build Tool

In this example we will use OpenCV 4.5.2.

OpenCV is choosen as an example of external library since it uses a CMake as build tool.
It also has *config.cmake configurations.

## Installing OpenCV
1. Download OpenCV source code at https://opencv.org/releases/ and extract to ~/Download/open-cv
2. Build steps are described [here](https://docs.opencv.org/master/d0/db2/tutorial_macos_install.html)
3. Create build directory ~/Download/open-cv/build
4. Run cmake, make, and make install
   ```bash
   cd ~/Download/open-cv/build
   cmake ..
   make
   sudo make install
   ```

   > If you got error with Zlib, try to disable it while 
   >
   > ```bash
   > cmake -D BUILD_ZLIB=OFF ..
   > ```
   

## Creating CMakeLists.txt
1. Set CMake minimum version and Project name
2. call find_package. 
   ```bash
   find_package(OpenCV REQUIRED)
   ```
   We use **REQUIRED** keyword to make it as mandatory dependency. CMake will fire error/fail build ifOpenCV not found. If we don't specify **REQUIRED**, CMake will threat it as **Optional** which willcontinue build eventhough OpenCV not found. 

3. In <code>find_package(...)</code> we use capital O,C,V "OpenCV" instead of "opencv".
   - **OpenCV** will search for <code>OpenCVConfig.cmake</code> which is exist<br/>
   - **opencv** will search for <code>opencvConfig.cmake</code> which is NOT exist

4. To get the location of OpenCVConfig.cmake, use unix find command:
    ``` bash
    $ find /usr -name "OpenCV*cmake"
    ```

    OUTPUT:
    ```
    /usr/local/lib/cmake/opencv4/OpenCVModules-release.cmake
    /usr/local/lib/cmake/opencv4/OpenCVConfig-version.cmake
    /usr/local/lib/cmake/opencv4/OpenCVConfig.cmake
    /usr/local/lib/cmake/opencv4/OpenCVModules.cmake
    ```

5. Open <code>/usr/local/lib/cmake/opencv4/OpenCVConfig.cmake</code> using nano editor. 
   In the <code>OpenCVConfig.cmake</code> we will get list of variables that can be used in our <code>CMakeLists.txt</code>

   This file will define the following variables:

      | Variable                       | Description                                                   | 
      | :---                           |     :---                                                 | 
      | OpenCV_LIBS                     | The list of all imported targets for OpenCV modules.
      | OpenCV_INCLUDE_DIRS             | The OpenCV include directories.
      | OpenCV_COMPUTE_CAPABILITIES     | The version of compute capability.
      | OpenCV_ANDROID_NATIVE_API_LEVEL | Minimum required level of Android API.
      | OpenCV_VERSION                  | The version of this OpenCV build: "4.5.2"
      | OpenCV_VERSION_MAJOR            | Major version part of OpenCV_VERSION: "4"
      | OpenCV_VERSION_MINOR            | Minor version part of OpenCV_VERSION: "5"
      | OpenCV_VERSION_PATCH            | Patch version part of OpenCV_VERSION: "2"
      | OpenCV_VERSION_STATUS           | Development status of this build: ""
 
   The Advanced variables are:
      | Advanced Variable                 | Description                                                   | 
      | :---                           |     :---                                                 | 
      | OpenCV_SHARED                   | Use OpenCV as shared library
      | OpenCV_INSTALL_PATH             | OpenCV location
      | OpenCV_LIB_COMPONENTS           | Present OpenCV modules list
      | OpenCV_USE_MANGLED_PATHS        | Mangled OpenCV path flag
 
   The Deprecated variables are:
    | Deprecated Variable                 | Description                                                   | 
      | :---                           |     :---                                                 | 
      | OpenCV_VERSION_TWEAK            | Always "0"
 
6. Use OpenCV_LIBS and OpenCV_INCLUDE_DIRS to include header and link lib 
   ``` bash
   target_include_directories(DisplayImage PRIVATE ${OpenCV_INCLUDE_DIRS})
   target_link_libraries(DisplayImage PRIVATE ${OpenCV_LIBS})

   ```

## Build and Run Example
1. navigate to build dir
   ``` bash
   mkdir build
   cd build
   cmake ..
   make
   ./DisplayImage
   ```