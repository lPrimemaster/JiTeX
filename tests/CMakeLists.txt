add_executable(simple_expression simple_expression.cpp)
target_link_libraries(simple_expression jitex)
target_include_directories(simple_expression PRIVATE "../include")
add_test(NAME simple_expression COMMAND simple_expression)


find_package(Threads REQUIRED)
# find_package(ANTLR REQUIRED)
add_executable(parser_test parser_test.cpp)
target_link_libraries(parser_test PRIVATE Threads::Threads jitex)
target_include_directories(parser_test PRIVATE "../include" ${ANTLR_Grammar_OUTPUT_DIR})
add_test(NAME parser_test COMMAND parser_test)

