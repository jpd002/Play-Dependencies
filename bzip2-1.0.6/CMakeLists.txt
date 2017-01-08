cmake_minimum_required(VERSION 2.8.8)

project(bzip2 C)

if (CMAKE_C_COMPILER_ID MATCHES "GNU")
    set(CMAKE_CXX_FLAGS
        "${CMAKE_CXX_FLAGS} -Wall -Winline -O2 -g")
endif ()

set(bz2_srcs
    blocksort.c
    huffman.c
    crctable.c
    randtable.c
    compress.c
    decompress.c
    bzlib.c)
if(WIN32)
  list(APPEND bz2_srcs libbz2.def)
endif()

add_library(bz2
    ${bz2_srcs})
set_target_properties(bz2
  PROPERTIES
    VERSION   1.0.6
    SOVERSION 1.0)
