# SPDX-FileCopyrightText: Copyright (C) 2019 OpenCppCoverage
# SPDX-FileCopyrightText: Copyright (c) 2026, Wissem Chiha
# SPDX-License-Identifier: GPl-3.0 license
cmake_minimum_required(VERSION 3.12...3.31)

project(vccov LANGUAGES C CXX)


# ============================================================================
# Properties
# ============================================================================
set(PROJECT_VERSION "0.9.9.0")
set(PROJECT_HOMEPAGE_URL "https://github.com/wissem01chiha/vccov")
set(PROJECT_DESCRIPTION "Open‑Source Code Coverage for Visual C++ on Windows")

# ============================================================================
# CPack
# ============================================================================
set(CPACK_PACKAGE_VENDOR "vccov-project")
set(CPACK_PACKAGE_DESCRIPTION_FILE ${CMAKE_SOURCE_DIR}/README.md)
set(CPACK_RESOURCE_FILE_LICENSE ${CMAKE_SOURCE_DIR}/LICENSE)
set(CPACK_RESOURCE_FILE_README ${CMAKE_SOURCE_DIR}/README.md)
set(CPACK_COMPONENTS_ALL Development Documentation Runtime)


# ============================================================================
# CTest
# ============================================================================
set (CTEST_OUTPUT_ON_FAILURE TRUE)


# ============================================================================
# CMake
# ============================================================================
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_C_VISIBILITY_PRESET hidden)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS ON)
set(CMAKE_C_STANDARD 17)

# ============================================================================
# Configuration
# ============================================================================
option(VCCOV_BUILD_TESTING "Enable vccov examples as tests" OFF)
option(BUILD_SHARED_LIBS "Enable building vccov shared library" OFF)
option(VCCOV_INSTALL "Enable installation of vccov" ON)
option(VCCOV_BUILD_SAMPLES "Enable building vccov sample scripts" ON)
option(VCCOV_BUILD_TOOLS "Enable building vccov tools in tools folder" OFF)
option(VCCOV_ASAN "Enable AddressSanitizer (ASan)" OFF)

# ============================================================================
# Build type
# ============================================================================
get_property(IS_MULTI GLOBAL PROPERTY GENERATOR_IS_MULTI_CONFIG)
if(NOT DEFINED CMAKE_BUILD_TYPE AND NOT IS_MULTI)
    message(STATUS "No CMAKE_BUILD_TYPE set -- using Release")
    set(CMAKE_BUILD_TYPE Release)
endif(NOT DEFINED CMAKE_BUILD_TYPE AND NOT IS_MULTI)

# ============================================================================
# Install prefix
# ============================================================================
if (CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    set(CMAKE_INSTALL_PREFIX "${CMAKE_CURRENT_BINARY_DIR}/install" CACHE PATH "Default install path" FORCE)
endif()

# ============================================================================
# Include
# ============================================================================
include(CheckCSourceCompiles)
include(CheckFunctionExists)
include(CheckIncludeFile)
include(CMakePackageConfigHelpers)
include(CheckTypeSize)
include(CheckCCompilerFlag)
include(CMakeDependentOption)
include(GNUInstallDirs)

# ============================================================================
# Flags
# ============================================================================



# ============================================================================
# Dependencies
# ============================================================================