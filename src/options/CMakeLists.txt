# SPDX-FileCopyrightText: Copyright (c) 2026, Vccov Project
# SPDX-License-Identifier: GPL-3.0 license
# src/options/CMakeLists.txt - Options and configuration parsing

add_library(vccov_options)

target_sources(vccov_options
    PRIVATE
        Options.cpp
        Options.hpp
        OptionsParser.cpp
        OptionsParser.hpp
        ProgramOptions.cpp
        ProgramOptions.hpp
        ProgramOptionsVariablesMap.hpp
        ExportOptionParser.cpp
        ExportOptionParser.hpp
        OptionsExport.cpp
        OptionsExport.hpp
        IOptionParser.hpp
)

target_include_directories(vccov_options
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/..
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
)

target_compile_features(vccov_options PRIVATE cxx_std_17)
