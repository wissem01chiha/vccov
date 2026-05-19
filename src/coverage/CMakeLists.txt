# SPDX-FileCopyrightText: Copyright (c) 2026, Vccov Project
# SPDX-License-Identifier: GPL-3.0 license
# src/coverage/CMakeLists.txt - Coverage engine and analysis

add_library(vccov_coverage)

target_sources(vccov_coverage
    PRIVATE
        # Monitor subsystem
        monitor/ExecutedAddressManager.cpp
        monitor/ExecutedAddressManager.hpp
        monitor/MonitoredLineRegister.cpp
        monitor/MonitoredLineRegister.hpp
        
        # Coverage computation
        computer/CoverageRate.cpp
        computer/CoverageRate.hpp
        computer/CoverageRateComputer.cpp
        computer/CoverageRateComputer.hpp
        
        # Coverage merging
        merger/CoverageDataMerger.cpp
        merger/CoverageDataMerger.hpp
        
        # Coverage runner
        runner/CodeCoverageRunner.cpp
        runner/CodeCoverageRunner.hpp
        runner/RunCoverageSettings.cpp
        runner/RunCoverageSettings.hpp
)

target_include_directories(vccov_coverage
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/..
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
)

target_link_libraries(vccov_coverage
    PRIVATE
        vccov_core
        vccov_filter
)

target_compile_features(vccov_coverage PRIVATE cxx_std_17)
