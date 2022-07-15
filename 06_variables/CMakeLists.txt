cmake_minimum_required(VERSION 3.0.0)

message ("=========== Basic =========")
message("hello world")


message ("=========== String vs List =========")
set(NAME "BOB Smith")
set(HEIGHT 190) 



message("my name is ${NAME}, ${HEIGHT} cm")

set(NAME1 "BOB Smith")
set(NAME2 BOB Smith)

message("NAME1 = ${NAME1} => is String")
message("NAME2 = ${NAME2} => is List")


message ("=========== Quoted vs Unquoted =========")

set(VAR aa bb cc)
#set(VAR aa;bb;cc)
#set(VAR "aa" "bb" "cc")
#set(VAR "aa bb cc")
#set(VAR "aa;bb;cc")


message(Unquoted: ${VAR})

message(Quoted: "${VAR}")

message("======== Dereferencing Variable =======")

set(NAME Alice)
set(Alice Bob)

set(XXXX_AliceBob Charlie)

message(${NAME}) # output: Alice
message(${${NAME}}) # output: Bob

#message(${NAME ${NAME} ${${NAME}}}) => ERROR karena ada spasi dalam key variable name (deference key)
message(${XXXX_${NAME}${${NAME}}}) #variablenya = XXXX_AliceBob. Sehingga output = Charlie
message("NAME ${NAME} ${${NAME}}")
