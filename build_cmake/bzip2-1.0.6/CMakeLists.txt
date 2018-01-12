cmake_minimum_required(VERSION 2.8.8)

project(bzip2 C)

if (CMAKE_C_COMPILER_ID MATCHES "GNU")
    set(CMAKE_CXX_FLAGS
        "${CMAKE_CXX_FLAGS} -Wall -Winline -O2 -g")
endif ()

set(bz2_srcs
    ../../bzip2-1.0.6/blocksort.c
    ../../bzip2-1.0.6/huffman.c
    ../../bzip2-1.0.6/crctable.c
    ../../bzip2-1.0.6/randtable.c
    ../../bzip2-1.0.6/compress.c
    ../../bzip2-1.0.6/decompress.c
    ../../bzip2-1.0.6/bzlib.c)
if(WIN32)
  list(APPEND bz2_srcs ../../bzip2-1.0.6/libbz2.def)
endif()

add_library(bz2
    ${bz2_srcs})
add_library(BZip2::BZip2 ALIAS bz2)
set_target_properties(bz2
  PROPERTIES
    VERSION   1.0.6
    SOVERSION 1.0)
target_include_directories(bz2 PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/../../bzip2-1.0.6/)
