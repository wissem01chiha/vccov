# SPDX-FileCopyrightText: Copyright (c) 2026, Vccov Project
# SPDX-License-Identifier: GPL-3.0 license


file(GLOB TEST_SOURCES CONFIGURE_DEPENDS "*.cpp")
if(TEST_SOURCES)
    add_executable(test_coverage ${TEST_SOURCES})
    target_include_directories(test_coverage PRIVATE ${CMAKE_SOURCE_DIR}/src)
    target_link_libraries(test_coverage PRIVATE vccov_coverage vccov_core gtest gtest_main)
    add_test(NAME test_coverage COMMAND test_coverage)
else()
    message(STATUS "No coverage tests found in ${CMAKE_CURRENT_SOURCE_DIR}")
endif()
