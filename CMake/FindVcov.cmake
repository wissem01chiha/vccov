#[=======================================================================[.rst:
Findvcov
-----------
Find the vcov library

.. code-block:: cmake

  find_package(vcov [<version>] [...])

Imported Targets
^^^^^^^^^^^^^^^^

The following targets are imported into the project:

    - ``vcov::vcov``  

Result Variables
^^^^^^^^^^^^^^^^
This module defines the following variables:

    - ``Vcov_FOUND``
        True if the library was found.

    - ``Vcov_VERSION``
        The version of the library.

    - ``Vcov_INCLUDE_DIRS``
        The include directories for the library.

    - ``Vcov_LIBRARIES``
        The libraries to link against.

    - ``Vcov_DEFINITIONS``
        Preprocessor definitions required by the library.

    - ``Vcov_COMPILE_OPTIONS``
        Compiler options required by the library.

    - ``Vcov_LINK_OPTIONS``
        Linker options required by the library.
#==========================================================================]