project(zlib C)

set(zlib_srcs
	../../zlib/adler32.c
	../../zlib/compress.c
	../../zlib/crc32.c
	../../zlib/deflate.c
	../../zlib/gzclose.c
	../../zlib/gzlib.c
	../../zlib/gzread.c
	../../zlib/gzwrite.c
	../../zlib/infback.c
	../../zlib/inffast.c
	../../zlib/inflate.c
	../../zlib/inftrees.c
	../../zlib/trees.c
	../../zlib/uncompr.c
	../../zlib/zutil.c
)

add_library(zlibstatic ${zlib_srcs})
add_library(ZLIB::ZLIB ALIAS zlibstatic)
target_compile_definitions(zlibstatic PRIVATE -DLIT_MEM=1)
target_include_directories(zlibstatic PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/../../zlib/)

