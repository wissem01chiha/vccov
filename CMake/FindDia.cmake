#[=======================================================================]
# FindDia
# -----------
# Find Microsoft Debug Interface Access SDK library
#
#   find_package(Dia REQUIRED)
#
# Find the native CTemplate includes and library
#
#  Dia_INCLUDE_DIRS       - The include directories for the library.
#  Dia_LIBRARIES          - The libraries to link against.
#  Dia_FOUND              - True if the DIA library was found.
#==========================================================================]

# by default DIA directories are not addded to system envirment variables 
# this need to be run from a developper command prompet
find_path(Dia_INCLUDE_DIR
    NAMES dia2.h
    PATHS "$ENV{VSINSTALLDIR}/DIA SDK/include"
    NO_DEFAULT_PATH
)

string(TOLOWER "${CMAKE_GENERATOR_PLATFORM}" _dia_platform)

if(_dia_platform STREQUAL "x64" OR _dia_platform STREQUAL "amd64")
    set(_DIA_LIB_PATHS ${Dia_INCLUDE_DIR}/../lib/amd64)
elseif(_dia_platform STREQUAL "arm64")
    set(_DIA_LIB_PATHS ${Dia_INCLUDE_DIR}/../lib/arm64)
elseif(_dia_platform STREQUAL "win32" OR _dia_platform STREQUAL "x86")
    set(_DIA_LIB_PATHS ${Dia_INCLUDE_DIR}/../lib)
else()
    set(_DIA_LIB_PATHS ${Dia_INCLUDE_DIR}/../lib/amd64 ${Dia_INCLUDE_DIR}/../lib/arm64 ${Dia_INCLUDE_DIR}/../lib)
endif()

find_library(Dia_LIBRARY diaguids.lib
    PATHS ${_DIA_LIB_PATHS}
    NO_DEFAULT_PATH
)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Dia DEFAULT_MSG Dia_INCLUDE_DIR Dia_LIBRARY)

if(Dia_FOUND)
  set(Dia_INCLUDE_DIRS ${Dia_INCLUDE_DIR})
  set(Dia_LIBRARIES ${Dia_LIBRARY})
endif()