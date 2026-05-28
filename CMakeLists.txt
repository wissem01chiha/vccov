# SPDX-FileCopyrightText: Copyright (c) 2026, Vccov Project Contributors
# SPDX-FileCopyrightText: Copyright (C) 2014-2019 OpenCppCoverage
# SPDX-License-Identifier: GPL-3.0 license
cmake_minimum_required(VERSION 3.20...3.31 FATAL_ERROR)

project(vccov LANGUAGES C CXX)

if(POLICY CMP0167)
  cmake_policy(SET CMP0167 NEW)
endif()

# ============================================================================
# Properties
# ============================================================================
set(PROJECT_VERSION "0.9.10.0")
set(PROJECT_HOMEPAGE_URL "https://github.com/wissem01chiha/vccov")
set(PROJECT_DESCRIPTION "Open-Source Code Coverage for Visual C++ on Windows")

# ============================================================================
# CPack
# ============================================================================
set(CPACK_PACKAGE_VENDOR "vccov-project")
set(CPACK_PACKAGE_DESCRIPTION_FILE ${CMAKE_SOURCE_DIR}/README.md)
set(CPACK_RESOURCE_FILE_LICENSE ${CMAKE_SOURCE_DIR}/LICENSE.txt)
set(CPACK_RESOURCE_FILE_README ${CMAKE_SOURCE_DIR}/README.md)
set(CPACK_COMPONENTS_ALL Development Documentation Runtime)

# ============================================================================
# CTest
# ============================================================================
set (CTEST_OUTPUT_ON_FAILURE TRUE)

# ============================================================================
# CMake Configuration
# ============================================================================
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_VISIBILITY_PRESET hidden)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# ============================================================================
# User Build Options
# ============================================================================
option(VCCOV_BUILD_TESTS "Build unit tests" OFF)
option(VCCOV_BUILD_EXAMPLES "Build example programs" OFF)
option(VCCOV_BUILD_PLUGINS "Build plugins" OFF)
option(VCCOV_INSTALL "Enable installation targets" ON)
option(BUILD_SHARED_LIBS "Build shared libraries" OFF)
option(VCCOV_ASAN "Enable AddressSanitizer (ASan)" OFF)
option(VCCOV_MSAN "Enable MemorySanitizer (MSan)" OFF)
option(VCCOV_UBSAN "Enable UndefinedBehaviorSanitizer (UBSan)" OFF)

# ============================================================================
# Build Configuration
# ============================================================================
get_property(IS_MULTI_CONFIG GLOBAL PROPERTY GENERATOR_IS_MULTI_CONFIG)
if(NOT IS_MULTI_CONFIG AND NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type" FORCE)
    message(STATUS "No build type specified, using Release")
endif()

# ============================================================================
# Install Configuration
# ============================================================================
if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    set(CMAKE_INSTALL_PREFIX "${CMAKE_BINARY_DIR}/install" 
    CACHE PATH "Installation prefix" FORCE)
endif()

# ============================================================================
# CMake Modules
# ============================================================================
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake")

# ============================================================================
# Include
# ============================================================================
include(CTest)
include(GNUInstallDirs)
include(compiler-warning-flags)
include(vccov-module)

# ============================================================================
# Flags
# ============================================================================
if(VCCOV_ASAN)
  if(CMAKE_C_COMPILER_ID MATCHES "AppleClang|GNU|Clang")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fno-omit-frame-pointer -fsanitize=address")
    set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -fno-omit-frame-pointer -fsanitize=address")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fno-omit-frame-pointer -fsanitize=address")
  elseif(MSVC)
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /fsanitize=address")
  endif()
endif()

if(VCCOV_MSAN)
  if(CMAKE_C_COMPILER_ID MATCHES "AppleClang|GNU|Clang")
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fno-omit-frame-pointer -fsanitize=memory")
    set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -fno-omit-frame-pointer -fsanitize=memory")
    set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -fno-omit-frame-pointer -fsanitize=memory")
  elseif(MSVC)
    set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} /fsanitize=memory")
  endif()
endif()

if(VCCOV_UBSAN)
  if(CMAKE_C_COMPILER_ID MATCHES "AppleClang|GNU|Clang")
        add_compile_options("-fsanitize=undefined" "-fno-sanitize-recover=undefined")
        if (NOT WIN32)
            add_link_options("-fsanitize=undefined")
        endif()
        if(MSVC)
            add_compile_options("/Oy-")
        else()
            add_compile_options("-fno-omit-frame-pointer")
        endif()
    endif()
endif()

# ============================================================================
# Dependencies
# ============================================================================
find_package(Boost 1.83 REQUIRED COMPONENTS filesystem)
find_package(GTest 1.17 REQUIRED)

# ============================================================================
# Subdirectories
# ============================================================================
add_subdirectory(src)
if(VCCOV_BUILD_TESTS)
    enable_testing()
    add_subdirectory(test)
endif()
if(VCCOV_BUILD_EXAMPLES)
    add_subdirectory(examples)
endif()
if(VCCOV_BUILD_PLUGINS)
    add_subdirectory(plugins)
endif()

# ============================================================================
# Installation
# ============================================================================
if(VCCOV_INSTALL)
    install(FILES ${vccov_public_headers}
      DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/vccov
    )
endif()

# ============================================================================
# Summary
# ============================================================================
message(STATUS "")
message(STATUS "vccov v${PROJECT_VERSION} build summary")
message(STATUS "================================================")
message(STATUS "Build Type:        ${CMAKE_BUILD_TYPE}")
message(STATUS "Build Tests:       ${VCCOV_BUILD_TESTS}")
message(STATUS "Build Examples:    ${VCCOV_BUILD_EXAMPLES}")
message(STATUS "Build Plugins:     ${VCCOV_BUILD_PLUGINS}")
message(STATUS "Install:           ${VCCOV_INSTALL}")
message(STATUS "Shared Libraries:  ${BUILD_SHARED_LIBS}")
message(STATUS "Install Prefix:    ${CMAKE_INSTALL_PREFIX}")
message(STATUS "================================================")
message(STATUS "")
