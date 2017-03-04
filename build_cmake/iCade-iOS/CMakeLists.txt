cmake_minimum_required(VERSION 2.8.8)

project(iCade)

set(iCade_Src
	../../iCade-iOS/iCadeReaderView.m
)

add_library(iCade_Static ${iCade_Src})
set_target_properties(iCade_Static PROPERTIES COMPILE_FLAGS "-x objective-c")
