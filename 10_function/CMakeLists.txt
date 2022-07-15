cmake_minimum_required(VERSION 3.0.0)

message("----- Basic Function --------")

function(my_print name_var)
	message("My name is ${name_var} => one dereferencing")
endfunction()

function(print_detail name_var)
	message("1. My name is ${${name_var}} => double dereferencing")
endfunction()

function(print_detail name_var)
	message("2. My name is ${${name_var}} => double dereferencing")
endfunction()

function(print_detail name_var)
	message("3. My name is ${${name_var}} => double dereferencing")
endfunction()

set(Name Charlie)


my_print(${Name})


print_detail(Name)
_print_detail(Name)
# __print_detail(Name) => ERROR UNKNOWN function




message(" ------ Optional Argument of Function -------")

function(print_detail_by_checking_optional name_var)
	message("My name is ${${name_var}}")

	if(DEFINED ARGV1)
		message("Hello, my name is ${ARGV1}")
	endif()

	message("ARGC=	${ARGC}")
	message("ARGV=	${ARGV}")
	message("ARGN=	${ARGN}")
	
	if(DEFINED ARGV0)
		message("ARGV0=	${ARGV0}")
	endif()
	if(DEFINED ARGV1)
		message("ARGV1=	${ARGV1}")
	endif()
	if(DEFINED ARGV2)
		message("ARGV2=	${ARGV2}")
	endif()
	if(DEFINED ARGV3)
		message("ARGV3=	${ARGV3}")
	endif()
endfunction()



set(Name Charlie)

print_detail_by_checking_optional(Name Bob Alice)