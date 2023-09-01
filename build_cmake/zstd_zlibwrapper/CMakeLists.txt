cmake_minimum_required(VERSION 3.5)

project(libzstdwapper C)

find_package(ZLIB)
if(NOT ZLIB_FOUND)
	MESSAGE("-- Using Provided zlib source")
	if(NOT TARGET zlibstatic)
		add_subdirectory(
			${CMAKE_CURRENT_SOURCE_DIR}/../zlib-1.2.8
			${CMAKE_CURRENT_BINARY_DIR}/zlib-1.2.8
		)
	endif()
endif(NOT ZLIB_FOUND)

set(ZSTD_BUILD_STATIC ON)
set(ZSTD_BUILD_SHARED  OFF)
set(ZSTD_BUILD_PROGRAMS OFF)
set(ZSTD_BUILD_TESTS_default  OFF)

if(NOT TARGET libzstd_static)
	add_subdirectory(
		${CMAKE_CURRENT_SOURCE_DIR}/../../zstd/build/cmake/
		${CMAKE_CURRENT_BINARY_DIR}/zstd
	)
endif()

file(GLOB zstd_zlibwrapperSource ${CMAKE_CURRENT_SOURCE_DIR}/../../zstd/zlibWrapper/*.c)
add_library(libzstd_zlibwrapper_static STATIC ${zstd_zlibwrapperSource})
target_link_libraries(libzstd_zlibwrapper_static PRIVATE libzstd_static PUBLIC ZLIB::ZLIB)
target_include_directories(libzstd_zlibwrapper_static PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/../../zstd/lib/ ${CMAKE_CURRENT_SOURCE_DIR}/../../zstd/zlibWrapper/)
target_compile_definitions(libzstd_zlibwrapper_static PUBLIC ZWRAP_USE_ZSTD)