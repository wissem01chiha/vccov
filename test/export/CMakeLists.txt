# SPDX-FileCopyrightText: Copyright (c) 2026, Vccov Project
# SPDX-License-Identifier: GPL-3.0 license

file(GLOB TEST_SOURCES CONFIGURE_DEPENDS "*.cpp")
if(TEST_SOURCES)
    add_executable(test_export ${TEST_SOURCES})
    target_include_directories(test_export PRIVATE ${CMAKE_SOURCE_DIR}/src)
    target_link_libraries(test_export PRIVATE vccov_export gtest gtest_main)
    add_test(NAME test_export COMMAND test_export)
else()
    message(STATUS "No export tests found in ${CMAKE_CURRENT_SOURCE_DIR}")
endif()
