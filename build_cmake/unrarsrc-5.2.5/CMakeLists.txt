cmake_minimum_required(VERSION 2.8.8)

project(unrar)

set(unrar_srcs
	../../unrarsrc-5.2.5/unrar/archive.cpp
	../../unrarsrc-5.2.5/unrar/arcread.cpp
	../../unrarsrc-5.2.5/unrar/blake2s.cpp
	../../unrarsrc-5.2.5/unrar/cmddata.cpp
	../../unrarsrc-5.2.5/unrar/consio.cpp
	../../unrarsrc-5.2.5/unrar/crc.cpp
	../../unrarsrc-5.2.5/unrar/crypt.cpp
	../../unrarsrc-5.2.5/unrar/encname.cpp
	../../unrarsrc-5.2.5/unrar/errhnd.cpp
	../../unrarsrc-5.2.5/unrar/extinfo.cpp
	../../unrarsrc-5.2.5/unrar/extract.cpp
	../../unrarsrc-5.2.5/unrar/filcreat.cpp
	../../unrarsrc-5.2.5/unrar/file.cpp
	../../unrarsrc-5.2.5/unrar/filefn.cpp
	../../unrarsrc-5.2.5/unrar/filestr.cpp
	../../unrarsrc-5.2.5/unrar/find.cpp
	../../unrarsrc-5.2.5/unrar/getbits.cpp
	../../unrarsrc-5.2.5/unrar/global.cpp
	../../unrarsrc-5.2.5/unrar/hash.cpp
	../../unrarsrc-5.2.5/unrar/headers.cpp
	../../unrarsrc-5.2.5/unrar/isnt.cpp
	../../unrarsrc-5.2.5/unrar/list.cpp
	../../unrarsrc-5.2.5/unrar/match.cpp
	../../unrarsrc-5.2.5/unrar/options.cpp
	../../unrarsrc-5.2.5/unrar/pathfn.cpp
	../../unrarsrc-5.2.5/unrar/qopen.cpp
	../../unrarsrc-5.2.5/unrar/rarvm.cpp
	../../unrarsrc-5.2.5/unrar/rawread.cpp
	../../unrarsrc-5.2.5/unrar/rdwrfn.cpp
	../../unrarsrc-5.2.5/unrar/recvol.cpp
	../../unrarsrc-5.2.5/unrar/resource.cpp
	../../unrarsrc-5.2.5/unrar/rijndael.cpp
	../../unrarsrc-5.2.5/unrar/rs.cpp
	../../unrarsrc-5.2.5/unrar/rs16.cpp
	../../unrarsrc-5.2.5/unrar/scantree.cpp
	../../unrarsrc-5.2.5/unrar/secpassword.cpp
	../../unrarsrc-5.2.5/unrar/sha1.cpp
	../../unrarsrc-5.2.5/unrar/sha256.cpp
	../../unrarsrc-5.2.5/unrar/smallfn.cpp
	../../unrarsrc-5.2.5/unrar/strfn.cpp
	../../unrarsrc-5.2.5/unrar/strlist.cpp
	../../unrarsrc-5.2.5/unrar/system.cpp
	../../unrarsrc-5.2.5/unrar/threadpool.cpp
	../../unrarsrc-5.2.5/unrar/timefn.cpp
	../../unrarsrc-5.2.5/unrar/ui.cpp
	../../unrarsrc-5.2.5/unrar/unicode.cpp
	../../unrarsrc-5.2.5/unrar/unpack.cpp
	../../unrarsrc-5.2.5/unrar/volume.cpp
)

add_library(unrar ${unrar_srcs})
if(CMAKE_COMPILER_IS_GNUCC OR CMAKE_COMPILER_IS_GNUCXX OR (CMAKE_C_COMPILER_ID MATCHES "Clang") OR (CMAKE_CXX_COMPILER_ID MATCHES "Clang"))
	target_compile_options(unrar PRIVATE "-w")
endif()
target_compile_definitions(unrar PRIVATE -DSILENT)
target_include_directories(unrar PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/../../unrarsrc-5.2.5/)
