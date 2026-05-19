# SPDX-FileCopyrightText: Copyright (c) 2026, Vccov Project
# SPDX-License-Identifier: GPL-3.0 license

add_library(vccov_core)

target_sources(vccov_core
    PRIVATE
        debugger/Debugger.cpp
        debugger/Debugger.hpp
        debugger/DebugInformationEnumerator.cpp
        debugger/DebugInformationEnumerator.hpp
        debugger/IDebugEventsHandler.cpp
        debugger/IDebugEventsHandler.hpp
        process/Process.cpp
        process/Process.hpp
        process/StartInfo.cpp
        process/StartInfo.hpp
        breakpoint/BreakPoint.cpp
        breakpoint/BreakPoint.hpp
        breakpoint/Address.cpp
        breakpoint/Address.hpp
        breakpoint/Handle.hpp
        exceptions/ExceptionHandler.cpp
        exceptions/ExceptionHandler.hpp
        exceptions/CppCoverageException.cpp
        exceptions/CppCoverageException.hpp
    )

target_include_directories(vccov_core
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/..
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}
)

target_compile_features(vccov_core PRIVATE cxx_std_17)
