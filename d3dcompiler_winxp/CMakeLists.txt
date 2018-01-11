cmake_minimum_required(VERSION 2.8.8)

project(d3dcompiler)

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
	set(D3DCOMPILER_PATH ${CMAKE_CURRENT_SOURCE_DIR}/Lib/x64/d3dcompiler.lib)
else()
	set(D3DCOMPILER_PATH ${CMAKE_CURRENT_SOURCE_DIR}/Lib/x86/d3dcompiler.lib)
endif()

add_library(d3dcompiler INTERFACE)
target_link_libraries(d3dcompiler INTERFACE ${D3DCOMPILER_PATH})
target_include_directories(d3dcompiler SYSTEM INTERFACE ${CMAKE_CURRENT_SOURCE_DIR}/Include)
