##
## PROJECT
## name and version
##
project(nlohmann_json VERSION 3.7.0 LANGUAGES CXX)

##
## CONFIGURATION
##

set(NLOHMANN_JSON_TARGET_NAME               ${PROJECT_NAME})
set(NLOHMANN_JSON_INCLUDE_BUILD_DIR "${PROJECT_SOURCE_DIR}/single_include/")
message(STATUS "Using the single-header code from ${NLOHMANN_JSON_INCLUDE_BUILD_DIR}")

##
## TARGET
## create target and add include path
##
add_library(${NLOHMANN_JSON_TARGET_NAME} INTERFACE)
add_library(${PROJECT_NAME}::${NLOHMANN_JSON_TARGET_NAME} ALIAS ${NLOHMANN_JSON_TARGET_NAME})
if (${CMAKE_VERSION} VERSION_LESS "3.8.0")
    target_compile_features(${NLOHMANN_JSON_TARGET_NAME} INTERFACE cxx_range_for)
else()
    target_compile_features(${NLOHMANN_JSON_TARGET_NAME} INTERFACE cxx_std_11)
endif()

target_include_directories(
    ${NLOHMANN_JSON_TARGET_NAME}
    INTERFACE
    $<BUILD_INTERFACE:${NLOHMANN_JSON_INCLUDE_BUILD_DIR}>
    $<INSTALL_INTERFACE:include>
)
