#[=======================================================================[.rst:
FindDIA
-----------
Find Microsoft Debug Interface Access SDK library

.. code-block:: cmake

  find_package(DIA [<version>] [...])

Result Variables
^^^^^^^^^^^^^^^^
This module defines the following variables:

    - ``DIA_FOUND``
        True if the library was found.

    - ``DIA_INCLUDE_DIRS``
        The include directories for the library.

    - ``DIA_LIBRARIES``
        The libraries to link against.
#]=======================================================================]

find_path(DIA_INCLUDE_DIR dia2.h)
find_library(DIA_LIBRARIES diaguids)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(DIA DEFAULT_MSG DIA_INCLUDE_DIR DIA_LIBRARIES)

if(DIA_FOUND)
  set(DIA_INCLUDE_DIRS ${DIA_INCLUDE_DIR})
  set(DIA_LIBRARIES ${DIA_LIBRARY})
endif()