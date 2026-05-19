# SPDX-FileCopyrightText: Copyright (c) 2026, Vccov Project
# SPDX-License-Identifier: GPL-3.0 license
# test/core/CMakeLists.txt - Core module tests

file(GLOB TEST_SOURCES CONFIGURE_DEPENDS "*.cpp")
if(TEST_SOURCES)
    add_executable(test_core ${TEST_SOURCES})
    target_include_directories(test_core PRIVATE ${CMAKE_SOURCE_DIR}/src)
    target_link_libraries(test_core PRIVATE vccov_core gtest gtest_main)
    add_test(NAME test_core COMMAND test_core)
else()
    message(STATUS "No core tests found in ${CMAKE_CURRENT_SOURCE_DIR}")
endif()
