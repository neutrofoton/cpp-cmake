add_library(${LIBRARY_NAME} STATIC hello.cc)

# target_include_directories(${LIBRARY_NAME} PUBLIC "./")
target_include_directories(${LIBRARY_NAME} PUBLIC 
    "./"
    "${CMAKE_BINARY_DIR}/config/include"
    )