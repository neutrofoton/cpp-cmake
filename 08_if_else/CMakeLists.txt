cmake_minimum_required(VERSION 3.0.0)

message("======= Basic ========")

set(VAR ON)
set(VAR2 VAR)

if(${VAR2})
	message("If block executed")
else()
	message("Else block executed")
endif()




message("===== Unary Test Operation =======")

set(Name Alice)

if(DEFINED Name)
	message("Name: if block executed")
else()
	message("Name: else block executed")
endif()


if(DEFINED Age)
	message("Age: if block executed")
else()
	message("Age: else block executed")
endif()





message("======== Binary Test Operation =======")

if(COMMAND target_link_library)
	message("target_link_library is a command")
else()
	message("target_link_library is NOT a command")
endif()

if(COMMAND target_link_libraries)
	message("target_link_libraries is a command")
else()
	message("target_link_libraries is NOT a command")
endif()

if(EXISTS /Users/neutro/workspace/work/personal/bitbucket2021/cpp-cmake/08_if_else/CMakeLists.txt)
	message("Given file exists")
else()
	message("File not found")
endif()




message("=========== Boolean Test Operation =======")

set(Name1 Charlie)
set(Name2 Charlies)

if(Name1 STRLESS Name2)
	message("${Name1} is less than ${Name2}")
elseif(Name1 STRGREATER Name2)
	message("${Name1} is greater than ${Name2}")
elseif(Name1 SRTEQUAL Name2)
	message("${Name1} is equal to ${Name2}")
endif()