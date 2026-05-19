# SPDX-FileCopyrightText: Copyright (c) 2026, Vccov Project
# SPDX-License-Identifier: GPL-3.0 license
# test/options/CMakeLists.txt - Options module tests

file(GLOB TEST_SOURCES CONFIGURE_DEPENDS "*.cpp")
if(TEST_SOURCES)
    add_executable(test_options ${TEST_SOURCES})
    target_include_directories(test_options PRIVATE ${CMAKE_SOURCE_DIR}/src)
    target_link_libraries(test_options PRIVATE vccov_options gtest gtest_main)
    add_test(NAME test_options COMMAND test_options)
else()
    message(STATUS "No options tests found in ${CMAKE_CURRENT_SOURCE_DIR}")
endif()
