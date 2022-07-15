project(Math_Project VERSION 1.0.1)

add_library(my_math
    src/addition.cpp
    src/division.cpp
)

# target_include_directories(my_math PUBLIC include)
target_include_directories( my_math PUBLIC
    $<INSTALL_INTERFACE:include>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
)


# install files mention secara explisit. Hasil copy di /usr/local/include/my_math
install(FILES 
    ${CMAKE_CURRENT_SOURCE_DIR}/include/addition.h 
    ${CMAKE_CURRENT_SOURCE_DIR}/include/division.h  
    DESTINATION 
    ${CMAKE_INSTALL_PREFIX}/include/my_math
)

# install(TARGETS my_math DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/my_math)
install(TARGETS my_math EXPORT my_export DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/my_math)

# install export file and specify FILE option to my_math-config.cmake
install(
    EXPORT my_export
    FILE my_math-config.cmake
    DESTINATION ${CMAKE_INSTALL_PREFIX}/lib/my_math
)