# SPDX-FileCopyrightText: Copyright (c) 2026, Vccov Project
# SPDX-License-Identifier: GPL-3.0 license

add_library(vccov_utils)

target_sources(vccov_utils
    PRIVATE
        filesystem/FileSystem.cpp
        filesystem/FileSystem.hpp
        filesystem/IFileSystem.hpp
        patterns/Patterns.cpp
        patterns/Patterns.hpp
        patterns/Wildcards.cpp
        patterns/Wildcards.hpp
)

target_include_directories(vccov_utils
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/..
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
)

target_compile_features(vccov_utils PRIVATE cxx_std_17)
