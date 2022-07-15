# Consuming External Library That Uses CMake Based Build Tool

In this example we will use OpenCV 4.5.2.

OpenCV is choosen as an example of external library since it uses a CMake as build tool.
It also has *config.cmake configurations.

## Installing OpenCV
1. Download OpenCV source code at https://opencv.org/releases/ and extract to ~/Download/open-cv
2. Build step : https://docs.opencv.org/master/d0/db2/tutorial_macos_install.html
3. Create build directory ~/Download/open-cv/build
4. $ cd ~/Download/open-cv/build
5. $ cmake ..
6. $ make
7. $ sudo make install

## Creating CMakeLists.txt
1. Set CMake minimum version and Project name
2. call find_package. 
    ``` 
    find_package(OpenCV REQUIRED)
    ```
    We use REQUIRED keyword to make it as mandatory dependency. CMake will fire error/fail build if OpenCV not found. If we don't specify REQUIRED, CMake will threat it as Optional which will continue build eventhough OpenCV not found. 

3. In find_package(...) we use capital O,C,V "OpenCV" instead of "opencv".
    OpenCV -> will search for OpenCVConfig.cmake -> exist
    opencv -> will search for opencvConfig.cmake -> NOT exist.

4. To get the location of OpenCVConfig.cmake, use unix find command:
    ```
    $ find /usr -name "OpenCV*cmake"

    OUTPUT:
    /usr/local/lib/cmake/opencv4/OpenCVModules-release.cmake
    /usr/local/lib/cmake/opencv4/OpenCVConfig-version.cmake
    /usr/local/lib/cmake/opencv4/OpenCVConfig.cmake
    /usr/local/lib/cmake/opencv4/OpenCVModules.cmake
    ```
5. Open /usr/local/lib/cmake/opencv4/OpenCVConfig.cmake using nano editor. 
    In the OpenCVConfig.cmake we will get list of variables that can be used in our CMakeLists.txt

    This file will define the following variables:
       - OpenCV_LIBS                     : The list of all imported targets for OpenCV modules.
       - OpenCV_INCLUDE_DIRS             : The OpenCV include directories.
       - OpenCV_COMPUTE_CAPABILITIES     : The version of compute capability.
       - OpenCV_ANDROID_NATIVE_API_LEVEL : Minimum required level of Android API.
       - OpenCV_VERSION                  : The version of this OpenCV build: "4.5.2"
       - OpenCV_VERSION_MAJOR            : Major version part of OpenCV_VERSION: "4"
       - OpenCV_VERSION_MINOR            : Minor version part of OpenCV_VERSION: "5"
       - OpenCV_VERSION_PATCH            : Patch version part of OpenCV_VERSION: "2"
       - OpenCV_VERSION_STATUS           : Development status of this build: ""
 
    Advanced variables:
       - OpenCV_SHARED                   : Use OpenCV as shared library
       - OpenCV_INSTALL_PATH             : OpenCV location
       - OpenCV_LIB_COMPONENTS           : Present OpenCV modules list
       - OpenCV_USE_MANGLED_PATHS        : Mangled OpenCV path flag
 
    Deprecated variables:
       - OpenCV_VERSION_TWEAK            : Always "0"
 
6. Use OpenCV_LIBS and OpenCV_INCLUDE_DIRS to include header and link lib 

   ```
   target_include_directories(DisplayImage PRIVATE ${OpenCV_INCLUDE_DIRS})
   target_link_libraries(DisplayImage PRIVATE ${OpenCV_LIBS})

   ```

## Build and Run Example
1. navigate to build dir
   ``` bash
   $ cd build
   $ cmake ..
   $ make
   $ ./DisplayImage
   ```