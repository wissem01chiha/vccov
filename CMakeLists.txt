cmake_minimum_required(VERSION 3.20...3.31 FATAL_ERROR)

project(vcov LANGUAGES C CXX)

set(PROJECT_VERSION "0.9.10.0")
set(PROJECT_HOMEPAGE_URL "https://github.com/wissem01chiha/vccov")
set(PROJECT_DESCRIPTION "Open-Source Code Coverage for Visual C++ on Windows")

set(CMAKE_CXX_VISIBILITY_PRESET hidden)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

option(VCOV_BUILD_TESTS "Build unit tests" OFF)
option(VCOV_BUILD_EXAMPLES "Build example programs" OFF)
option(VCOV_INSTALL "Enable installation targets" ON)
option(BUILD_SHARED_LIBS "Build shared libraries" ON)
option(VCOV_ASAN "Enable AddressSanitizer (ASan)" OFF)
option(VCOV_MSAN "Enable MemorySanitizer (MSan)" OFF)
option(VCOV_UBSAN "Enable UndefinedBehaviorSanitizer (UBSan)" OFF)

get_property(IS_MULTI_CONFIG GLOBAL PROPERTY GENERATOR_IS_MULTI_CONFIG)
if(NOT IS_MULTI_CONFIG AND NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type" FORCE)
    message(STATUS "No build type specified, using Release")
endif()


list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/CMake")

include(CTest)
include(GNUInstallDirs)
include(Module)
include(Sanitizer)
include(Testing)
include(Install)

find_package(Dia REQUIRED)
find_program(PROTOC protoc REQUIRED)
find_package(Boost 1.83 REQUIRED COMPONENTS 
    filesystem 
    program_options 
    algorithm 
    log 
    iostreams 
    locale 
    optional 
    container 
    regex 
    range 
    property_tree 
    spirit 
    uuid)
find_package(GTest 1.17.0 REQUIRED)
find_package(Protobuf CONFIG REQUIRED)
find_package(CTemplate REQUIRED)

if(BUILD_SHARED_LIBS)
    set(BUILD_SHARED_LIBS 1)
else()
    set(BUILD_SHARED_LIBS 0)
endif()
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/VcovExport.h.in 
    ${CMAKE_CURRENT_BINARY_DIR}/VcovExport.h
)

add_subdirectory(Common)
add_subdirectory(Core)
add_subdirectory(Platform)
add_subdirectory(Export)
add_subdirectory(Option)
add_subdirectory(Filter)
add_subdirectory(Plugin/Core)
add_subdirectory(Plugin/Binary)
add_subdirectory(Coverage)
add_subdirectory(Plugin/Cobertura)
add_subdirectory(Plugin/Html)
# add_subdirectory(Console)
# add_subdirectory(Utilities) 
# add_subdirectory(Testing)
# add_subdirectory(Examples)

message(STATUS "")
message(STATUS "Vcov Build Summary")
message(STATUS "=====================================================================")
message(STATUS "Project Version:   ${PROJECT_VERSION}")
message(STATUS "Platfrom:          ${CMAKE_GENERATOR_PLATFORM}")
message(STATUS "Architecture:      ${CMAKE_SYSTEM_PROCESSOR}")
message(STATUS "Build Type:        ${CMAKE_BUILD_TYPE}")
message(STATUS "CMake Version:     ${CMAKE_VERSION}")
message(STATUS "Compiler:          ${CMAKE_CXX_COMPILER_ID} ${CMAKE_CXX_COMPILER_VERSION}")
message(STATUS "Protobuf Compiler: ${Protobuf_VERSION}")
message(STATUS "CMake Generator:   ${CMAKE_GENERATOR}")
message(STATUS "Build Tests:       ${VCOV_BUILD_TESTS}")
message(STATUS "Build Examples:    ${VCOV_BUILD_EXAMPLES}")
message(STATUS "Shared Libraries:  ${BUILD_SHARED_LIBS}")
message(STATUS "Install:           ${VCOV_INSTALL}")
message(STATUS "Install Prefix:    ${CMAKE_INSTALL_PREFIX}")
message(STATUS "=====================================================================")
message(STATUS "")
