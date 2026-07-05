# Testing Utilities Library

This directory contains the Testing utility library—a static library that provides shared helper utilities and infrastructure for unit tests across vcov modules.

## Availability

This library is automatically built and linked when vcov is compiled with the `VCOV_BUILD_TESTS` CMake option enabled (`-DVCOV_BUILD_TESTS=ON`).

## Dependencies

- GTest
- GMock
