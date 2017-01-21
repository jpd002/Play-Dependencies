if ( NOT DEFINED CMAKE_BUILD_TYPE )
  set( CMAKE_BUILD_TYPE Release CACHE STRING "Build type" )
endif ()

project (glew)

cmake_minimum_required (VERSION 2.8.7)

include(GNUInstallDirs)

if (COMMAND cmake_policy)
  cmake_policy (SET CMP0003 NEW)
endif()

set(CMAKE_DEBUG_POSTFIX d)

set (GLEW_DIR ${CMAKE_CURRENT_SOURCE_DIR})

if (WIN32)
  set (GLEW_LIB_NAME glew32)
else ()
  set (GLEW_LIB_NAME GLEW)
  set (DLL_PREFIX lib)
endif ()

find_package (OpenGL REQUIRED)
set (GLEW_LIBRARIES ${OPENGL_LIBRARIES})

add_definitions (-DGLEW_NO_GLU)

#### GLEW ####

include_directories (${GLEW_DIR}/include)

set (GLEW_PUBLIC_HEADERS_FILES ${GLEW_DIR}/include/GL/wglew.h ${GLEW_DIR}/include/GL/glew.h ${GLEW_DIR}/include/GL/glxew.h)
set (GLEW_SRC_FILES ${GLEW_DIR}/src/glew.c)

if (WIN32)
  list (APPEND GLEW_SRC_FILES ${GLEW_DIR}/src/glew.rc)
endif ()

add_library (glew SHARED ${GLEW_PUBLIC_HEADERS_FILES} ${GLEW_SRC_FILES})
set_target_properties (glew PROPERTIES COMPILE_DEFINITIONS "GLEW_BUILD" OUTPUT_NAME "${GLEW_LIB_NAME}" PREFIX "${DLL_PREFIX}")
add_library (glew_s STATIC ${GLEW_PUBLIC_HEADERS_FILES} ${GLEW_SRC_FILES})
set_target_properties (glew_s PROPERTIES COMPILE_DEFINITIONS "GLEW_STATIC" OUTPUT_NAME "${GLEW_LIB_NAME}" PREFIX lib)

if (MSVC)
  # add options from visual studio project
  target_compile_definitions (glew PRIVATE "GLEW_BUILD;VC_EXTRALEAN")
  target_compile_definitions (glew_s PRIVATE "GLEW_STATIC;VC_EXTRALEAN")
  target_link_libraries (glew LINK_PRIVATE -BASE:0x62AA0000)
  # kill security checks which are dependent on stdlib
  target_compile_options (glew PRIVATE -GS-)
  target_compile_options (glew_s PRIVATE -GS-)
  # remove stdlib dependency
  target_link_libraries (glew LINK_PRIVATE -nodefaultlib -noentry)
  # remove Run-Time Error Checks
  string(REGEX REPLACE "/RTC(su|[1su])" "" CMAKE_C_FLAGS_DEBUG ${CMAKE_C_FLAGS_DEBUG})
elseif (WIN32 AND ((CMAKE_C_COMPILER_ID MATCHES "GNU") OR (CMAKE_C_COMPILER_ID MATCHES "Clang")))
  # remove stdlib dependency on windows with GCC and Clang (for similar reasons
  # as to MSVC - to allow it to be used with any Windows compiler)
  target_compile_options (glew PRIVATE -fno-builtin -fno-stack-protector)
  target_compile_options (glew_s PRIVATE -fno-builtin -fno-stack-protector)
  target_link_libraries (glew LINK_PRIVATE -nostdlib)
endif ()

target_link_libraries (glew LINK_PUBLIC ${GLEW_LIBRARIES})
target_link_libraries (glew_s ${GLEW_LIBRARIES})

