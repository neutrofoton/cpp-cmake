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