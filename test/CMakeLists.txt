# SPDX-FileCopyrightText: Copyright (c) 2026, Vccov Project
# SPDX-License-Identifier: GPL-3.0 license
# test/CMakeLists.txt - Unit tests (mirrors src/ structure)

enable_testing()

# Include test subdirectories organized by module
add_subdirectory(core)
add_subdirectory(coverage)
add_subdirectory(filter)
add_subdirectory(options)
add_subdirectory(export)
add_subdirectory(utils)
add_subdirectory(cli)

message(STATUS "Tests configured and enabled")
