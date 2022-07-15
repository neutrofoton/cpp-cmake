cmake_minimum_required(VERSION 3.0.0)

project(Calculator_Project VERSION 1.0.0)


set(A "123" CACHE STRING "This command sets variable A in persistent cache")
message($CACHE{A})


set(Name Alice CACHE STRING "The name variable")
# set(Name Bob CACHE STRING "The modified name variable" FORCE)

message($CACHE{Name})