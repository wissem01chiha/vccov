# SPDX-FileCopyrightText: Copyright (c) 2026, Vccov Project
# SPDX-License-Identifier: GPL-3.0 license
# src/cli/CMakeLists.txt - Command-line interface executable

add_executable(vccov)

target_sources(vccov
    PRIVATE
        main.cpp
        OpenCppCoverage.cpp
        OpenCppCoverage.hpp
)

target_include_directories(vccov
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/..
        ${CMAKE_CURRENT_SOURCE_DIR}
)

target_link_libraries(vccov
    PRIVATE
        vccov_core
        vccov_coverage
        vccov_filter
        vccov_options
        vccov_export
        vccov_platform
        vccov_utils
)

target_compile_features(vccov PRIVATE cxx_std_17)

if(VCCOV_INSTALL)
    install(TARGETS vccov
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    )
endif()
