add_subdirectory(common)
add_subdirectory(tools)
add_subdirectory(utils)
add_subdirectory(platform)
add_subdirectory(options)
add_subdirectory(core)
add_subdirectory(filter)
add_subdirectory(coverage)
add_subdirectory(export)


add_library(libvccov INTERFACE)
target_link_libraries(libvccov
    INTERFACE
        vccov::core
        vccov::coverage
        vccov::filter
        vccov::options
        vccov::export
        vccov::platform
        vccov::utils
        vccov::tools
)
target_include_directories(libvccov
    INTERFACE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
        $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}/vccov>
)

add_subdirectory(console)