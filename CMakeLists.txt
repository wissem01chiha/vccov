# SPDX-FileCopyrightText: Copyright (C) 2019 OpenCppCoverage
# SPDX-FileCopyrightText: Copyright (c) 2026, Wissem Chiha
# SPDX-License-Identifier: GPL-3.0 license
cmake_minimum_required(VERSION 3.20...3.31)

project(vccov 
    VERSION 0.9.9.0
    DESCRIPTION "Open‑Source Code Coverage for Visual C++ on Windows"
    HOMEPAGE_URL "https://github.com/wissem01chiha/vccov"
    LANGUAGES C CXX
)

# ============================================================================
# Build Configuration
# ============================================================================
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_VISIBILITY_PRESET hidden)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

# ulti-config generators 
get_property(IS_MULTI_CONFIG GLOBAL PROPERTY GENERATOR_IS_MULTI_CONFIG)
if(NOT IS_MULTI_CONFIG AND NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Release CACHE STRING "Build type" FORCE)
    message(STATUS "No build type specified, using Release")
endif()

# ============================================================================
# Install Configuration
# ============================================================================
if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    set(CMAKE_INSTALL_PREFIX "${CMAKE_BINARY_DIR}/install" CACHE PATH "Installation prefix" FORCE)
endif()

include(GNUInstallDirs)

# ============================================================================
# Project Options
# ============================================================================
option(VCCOV_BUILD_TESTS "Build unit tests" ON)
option(VCCOV_BUILD_EXAMPLES "Build example programs" OFF)
option(VCCOV_INSTALL "Enable installation targets" ON)
option(VCCOV_ENABLE_ASAN "Enable AddressSanitizer" OFF)
option(BUILD_SHARED_LIBS "Build shared libraries" OFF)

# ============================================================================
# Project Setup
# ============================================================================
list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules")

enable_testing()

# ============================================================================
# Subdirectories
# ============================================================================
add_subdirectory(src)
if(VCCOV_BUILD_TESTS)
    add_subdirectory(test)
endif()
if(VCCOV_BUILD_EXAMPLES)
    add_subdirectory(examples)
endif()

# ============================================================================
# Summary
# ============================================================================
message(STATUS "")
message(STATUS "vccov v${PROJECT_VERSION} Configuration Summary")
message(STATUS "================================================")
message(STATUS "Build Type:        ${CMAKE_BUILD_TYPE}")
message(STATUS "Build Tests:       ${VCCOV_BUILD_TESTS}")
message(STATUS "Build Examples:    ${VCCOV_BUILD_EXAMPLES}")
message(STATUS "Install:           ${VCCOV_INSTALL}")
message(STATUS "Shared Libraries:  ${BUILD_SHARED_LIBS}")
message(STATUS "Install Prefix:    ${CMAKE_INSTALL_PREFIX}")
message(STATUS "================================================")
message(STATUS "")
