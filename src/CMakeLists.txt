# SPDX-FileCopyrightText: Copyright (c) 2026, Vccov Project
# SPDX-License-Identifier: GPL-3.0 license
# src/CMakeLists.txt - Main source library and CLI executable

# ============================================================================
# Export Headers
# ============================================================================
set(VCCOV_PUBLIC_HEADERS
    ${CMAKE_CURRENT_SOURCE_DIR}/CppCoverageExport.hpp
    ${CMAKE_CURRENT_SOURCE_DIR}/OpenCppCoverageExport.hpp
    ${CMAKE_CURRENT_SOURCE_DIR}/OpenCppCoverageException.hpp
    ${CMAKE_CURRENT_SOURCE_DIR}/SubstitutePdbSourcePath.hpp
)

# ============================================================================
# Core Module
# ============================================================================
add_subdirectory(core)

# ============================================================================
# Coverage Engine Module
# ============================================================================
add_subdirectory(coverage)

# ============================================================================
# Filtering Module
# ============================================================================
add_subdirectory(filter)

# ============================================================================
# Options/CLI Module
# ============================================================================
add_subdirectory(options)

# ============================================================================
# Export Module
# ============================================================================
add_subdirectory(export)

# ============================================================================
# Platform-Specific Module
# ============================================================================
add_subdirectory(platform)

# ============================================================================
# Utilities Module
# ============================================================================
add_subdirectory(utils)

# ============================================================================
# Tools Module
# ============================================================================
# ============================================================================
add_subdirectory(tools)
# ============================================================================
# Library Target: vccov_lib (interface aggregator)
# ============================================================================
add_library(vccov_lib INTERFACE)

target_link_libraries(vccov_lib
    INTERFACE
        vccov_core
        vccov_coverage
        vccov_filter
        vccov_options
        vccov_export
        vccov_platform
        vccov_utils
        vccov_tools
)

if(VCCOV_INSTALL)
    install(TARGETS vccov_lib
        ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
    )
    install(FILES ${VCCOV_PUBLIC_HEADERS}
        DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/vccov
    )
endif()

# ============================================================================
# CLI Executable: vccov
# ============================================================================
add_subdirectory(cli)
