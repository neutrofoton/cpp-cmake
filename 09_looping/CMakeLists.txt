cmake_minimum_required(VERSION 3.0.0)

message("===== Basic Append a Value to List =======")
set(VAR a)
set(VAR ${VAR}a)
#set(VAR ${VAR}a)
#set(VAR ${VAR}a)
#set(VAR ${VAR}a)
#set(VAR ${VAR}a)
#set(VAR ${VAR}a)
#set(VAR ${VAR}a)
#set(VAR ${VAR}a)
#set(VAR ${VAR}a)

message(${VAR})



message("===== WHILE =======")

while(NOT VAR STREQUAL "aaaaaaaaaa")
	set(VAR ${VAR}a)
	message(${VAR})
endwhile()


message("===== FOREACH -> of Range =======")
foreach(x RANGE 100 105)
	message("Person_${x}")
endforeach()

message("===== FOREACH -> of List =======")

foreach(Name Alice Bob Charlie)
	message(${Name})
endforeach()

set(VAR1 0;1)
set(VAR2 2 3)
set(VAR3 "4;5")

foreach(x IN LISTS VAR1 VAR2 VAR3)
	message("x = ${x}")
endforeach()
