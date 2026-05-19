# SPDX-FileCopyrightText: Copyright (c) 2026, Vccov Project
# SPDX-License-Identifier: GPL-3.0 license
# src/platform/CMakeLists.txt - Platform-specific code

add_library(vccov_platform)

target_sources(vccov_platform
    PRIVATE
        # Windows-specific - Handle management
        windows/handle/HandleInformation.cpp
        windows/handle/HandleInformation.hpp
)

target_include_directories(vccov_platform
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/..
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
)

# Windows-specific dependencies
if(WIN32)
    target_link_libraries(vccov_platform
        PRIVATE
            diaguids.lib
    )
endif()

target_compile_features(vccov_platform PRIVATE cxx_std_17)
