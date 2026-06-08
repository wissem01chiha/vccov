#[=======================================================================[.rst:
FindDia
-----------
Find Microsoft Debug Interface Access SDK library

.. code-block:: cmake

  find_package(Dia [<version>] [...])

Result Variables
^^^^^^^^^^^^^^^^
This module defines the following variables:

    - ``Dia_FOUND``
        True if the library was found.

    - ``Dia_INCLUDE_DIRS``
        The include directories for the library.

    - ``Dia_LIBRARIES``
        The libraries to link against.
#]=======================================================================]

find_path(Dia_INCLUDE_DIR dia2.h)

string(TOLOWER "${CMAKE_GENERATOR_PLATFORM}" _dia_platform)
if(_dia_platform STREQUAL "x64" OR _dia_platform STREQUAL "amd64")
    set(_DIA_ARCH_DIRS
        amd64
        arm64
    )
elseif(_dia_platform STREQUAL "arm64")
    set(_DIA_ARCH_DIRS
        arm64
        amd64
        x64
        x86
    )
else()
    set(_DIA_ARCH_DIRS
        amd64
        x64
        x86
        arm64
        arm
    )
endif()

set(_DIA_LIB_PATHS)
foreach(_arch IN LISTS _DIA_ARCH_DIRS)
    list(APPEND _DIA_LIB_PATHS ${Dia_INCLUDE_DIR}/../lib/${_arch})
endforeach()

find_library(Dia_LIBRARY diaguids.lib
    PATHS ${_DIA_LIB_PATHS}
    NO_DEFAULT_PATH
)

if(NOT Dia_LIBRARY)
    find_library(Dia_LIBRARY diaguids.lib
        PATHS ${Dia_INCLUDE_DIR}/.. ${Dia_INCLUDE_DIR}/../.. ${Dia_INCLUDE_DIR}/../../..
        PATH_SUFFIXES lib/${_DIA_ARCH_DIRS}
    )
endif()

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Dia DEFAULT_MSG Dia_INCLUDE_DIR Dia_LIBRARY)

if(Dia_FOUND)
  set(Dia_INCLUDE_DIRS ${Dia_INCLUDE_DIR})
  set(Dia_LIBRARIES ${Dia_LIBRARY})
endif()
