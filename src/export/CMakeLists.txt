# SPDX-FileCopyrightText: Copyright (c) 2026, Vccov Project
# SPDX-License-Identifier: GPL-3.0 license
# src/export/CMakeLists.txt - Export functionality

add_library(vccov_export INTERFACE)

target_include_directories(vccov_export
    INTERFACE
        ${CMAKE_CURRENT_SOURCE_DIR}/..
)

if(VCCOV_INSTALL)
    install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/plugins
        DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/vccov/export
        FILES_MATCHING PATTERN "*.hpp"
    )
endif()
