# SPDX-FileCopyrightText: Copyright (c) 2026, Vccov Project
# SPDX-License-Identifier: GPL-3.0 license
# src/filter/CMakeLists.txt - Coverage filtering system

add_library(vccov_filter)

target_sources(vccov_filter
    PRIVATE
        CoverageFilterManager.cpp
        CoverageFilterManager.hpp
        CoverageFilterSettings.cpp
        CoverageFilterSettings.hpp
        ICoverageFilterManager.hpp
        FilterAssistant.cpp
        FilterAssistant.hpp
        UnifiedDiffCoverageFilterManager.cpp
        UnifiedDiffCoverageFilterManager.hpp
        UnifiedDiffSettings.cpp
        UnifiedDiffSettings.hpp
        WildcardCoverageFilter.cpp
        WildcardCoverageFilter.hpp
        # Additional files from FileFilter module
        AmbiguousPathException.cpp
        AmbiguousPathException.hpp
        File.cpp
        File.hpp
        FileFilterException.hpp
        FileInfo.hpp
        IRelocationsExtractor.hpp
        LineFilter.cpp
        LineFilter.hpp
        LineInfo.hpp
        ModuleInfo.hpp
        PathMatcher.cpp
        PathMatcher.hpp
        ReleaseCoverageFilter.cpp
        ReleaseCoverageFilter.hpp
        RelocationsExtractor.cpp
        RelocationsExtractor.hpp
        UnifiedDiffCoverageFilter.cpp
        UnifiedDiffCoverageFilter.hpp
        UnifiedDiffParser.cpp
        UnifiedDiffParser.hpp
        UnifiedDiffParserException.cpp
        UnifiedDiffParserException.hpp
)

target_include_directories(vccov_filter
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/..
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
)

target_compile_features(vccov_filter PRIVATE cxx_std_17)
