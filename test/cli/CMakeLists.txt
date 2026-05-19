# SPDX-FileCopyrightText: Copyright (c) 2026, Vccov Project
# SPDX-License-Identifier: GPL-3.0 license

file(GLOB TEST_SOURCES CONFIGURE_DEPENDS "*.cpp")
if(TEST_SOURCES)
    add_executable(test_cli ${TEST_SOURCES})
    target_include_directories(test_cli PRIVATE ${CMAKE_SOURCE_DIR}/src)
    target_link_libraries(test_cli PRIVATE vccov_core vccov_options gtest gtest_main)
    add_test(NAME test_cli COMMAND test_cli)
else()
    message(STATUS "No cli tests found in ${CMAKE_CURRENT_SOURCE_DIR}")
endif()
