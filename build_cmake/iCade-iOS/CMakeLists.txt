cmake_minimum_required(VERSION 3.5)

project(iCade)

set(iCade_Src
	../../iCade-iOS/iCadeReaderView.m
)

add_library(iCade_Static ${iCade_Src})
set_target_properties(iCade_Static PROPERTIES COMPILE_FLAGS "-x objective-c")
target_include_directories(iCade_Static PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/../../iCade-iOS/)

