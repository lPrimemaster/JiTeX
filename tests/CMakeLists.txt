add_executable(simple_expression simple_expression.cpp)
target_link_libraries(simple_expression jitex)
target_include_directories(simple_expression PRIVATE "../include")
add_test(NAME simple_expression COMMAND simple_expression)

