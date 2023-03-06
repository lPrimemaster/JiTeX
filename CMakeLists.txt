cmake_minimum_required(VERSION 3.16)
project(JITeX VERSION 0.1.0 LANGUAGES CXX)

list(APPEND CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake)

set(CMAKE_CXX_STANDARD 17)

add_definitions(-DANTLR4CPP_STATIC)

if(NOT EXISTS ${PROJECT_SOURCE_DIR}/third-party/antlr-4.12.0-complete.jar)
    file(MAKE_DIRECTORY ${PROJECT_SOURCE_DIR}/third-party)
    file(DOWNLOAD https://www.antlr.org/download/antlr-4.12.0-complete.jar ${PROJECT_SOURCE_DIR}/third-party/antlr-4.12.0-complete.jar SHOW_PROGRESS)
endif()
set(ANTLR4_TAG 4.12.0)
set(ANTLR4_ZIP_REPOSITORY https://github.com/antlr/antlr4/archive/refs/tags/4.12.0.zip)

include(ExternalAntlr4Cpp)
include_directories(${ANTLR4_INCLUDE_DIRS})

set(ANTLR_EXECUTABLE ${PROJECT_SOURCE_DIR}/third-party/antlr-4.12.0-complete.jar)
find_package(ANTLR REQUIRED)

antlr_target(Grammar Language.g4 OUTPUT_DIRECTORY)

include_directories(${ANTLR_Grammar_OUTPUT_DIR})
message(STATUS ${ANTLR_Grammar_OUTPUT_DIR})
# include_directories(${ANTLR_GrammarParser_OUTPUT_DIR})


add_subdirectory(NativeJIT)

add_library(jitex STATIC
    include/jitex.h
    src/jitex.cpp
    ${ANTLR_Grammar_CXX_OUTPUTS}
    # ${ANTLR_GrammarParser_CXX_OUTPUTS}
)

target_include_directories(jitex PUBLIC "../include")
target_link_libraries(jitex NativeJIT antlr4_static)

enable_testing()
add_subdirectory(tests)