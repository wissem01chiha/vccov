set(CPACK_PACKAGE_VENDOR "vcov-project")
set(CPACK_PACKAGE_DESCRIPTION_FILE ${CMAKE_SOURCE_DIR}/README.md)
set(CPACK_RESOURCE_FILE_LICENSE ${CMAKE_SOURCE_DIR}/LICENSE.txt)
set(CPACK_RESOURCE_FILE_README ${CMAKE_SOURCE_DIR}/README.md)
set(CPACK_COMPONENTS_ALL Development Documentation Runtime)

# ============================================================================
# Install Configuration
# ============================================================================
if(CMAKE_INSTALL_PREFIX_INITIALIZED_TO_DEFAULT)
    set(CMAKE_INSTALL_PREFIX "${CMAKE_BINARY_DIR}/install" 
    CACHE PATH "Installation prefix" FORCE)
endif()

# ============================================================================
# Installation
# ============================================================================
if(VCCOV_INSTALL)
    install(FILES ${vccov_public_headers}
      DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/vccov
    )
endif()