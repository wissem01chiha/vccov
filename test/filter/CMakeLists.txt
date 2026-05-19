# SPDX-FileCopyrightText: Copyright (c) 2026, Vccov Project
# SPDX-License-Identifier: GPL-3.0 license
# test/filter/CMakeLists.txt - Filter module tests

file(GLOB TEST_SOURCES CONFIGURE_DEPENDS "*.cpp")
if(TEST_SOURCES)
    add_executable(test_filter ${TEST_SOURCES})
    target_include_directories(test_filter PRIVATE ${CMAKE_SOURCE_DIR}/src)
    target_link_libraries(test_filter PRIVATE vccov_filter gtest gtest_main)
    add_test(NAME test_filter COMMAND test_filter)
else()
    message(STATUS "No filter tests found in ${CMAKE_CURRENT_SOURCE_DIR}")
endif()
