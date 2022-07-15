project(Math_Project VERSION 1.0.1)

add_library(my_math
    src/addition.cpp
    src/division.cpp
)

# include -> name of ditectorry of header/include
# PUBLIC -> scope yang memungkinkan lokasi header accessible oleh source lain tanpa harus specify full path, misal main.cpp

# target_include_directories(target_name | scope| arguments)
# example:
# target_include_directories(my_math PRIVATE xxx PUBLIC yyy)
# or
# target_include_directories(my_math PRIVATE xxx)
# target_include_directories(my_math PUBLIC yyy)

target_include_directories(my_math PUBLIC include)




# Show cache variable
message("====== Show cache variable subdirectory MyMath=========")

message(MyMath -> CMAKE_CURRENT_SOURCE_DIR = ${CMAKE_CURRENT_SOURCE_DIR})

#[[


# install seluruh directory. Hasil copy di /usr/local/include/my_math/include
install(DIRECTORY 
    ${CMAKE_CURRENT_SOURCE_DIR}/include
    DESTINATION 
    ${CMAKE_INSTALL_PREFIX}/include/my_math
    FILES_MATCHING PATTERN "*.h"
)

]]#

# install files mention secara explisit. Hasil copy di /usr/local/include/my_math
install(FILES 
    ${CMAKE_CURRENT_SOURCE_DIR}/include/addition.h 
    ${CMAKE_CURRENT_SOURCE_DIR}/include/division.h  
    DESTINATION 
    ${CMAKE_INSTALL_PREFIX}/include/my_math
)

install(TARGETS my_math DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/my_math)

