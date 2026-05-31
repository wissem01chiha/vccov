#[==[.rst:
.. cmake:command:: vcov_module_add_module

  .. code-block:: cmake

    vcov_module_add_module(<name> 
        CLASSES [<class>...] 
        SOURCES [<source>...] 
        HEADERS [<header>...] 
    )
#]==]
function (vcov_module_add_module name)
    cmake_parse_arguments(PARSE_ARGV 1 _vcov "" "" "CLASSES;SOURCES;HEADERS")
    if(NOT _vcov_SOURCES AND NOT _vcov_CLASSES AND NOT _vcov_HEADERS)
        message(FATAL_ERROR "No sources, classes, or headers provided for module ${name}")
    endif()
    if (_vcov_SOURCES OR _vcov_CLASSES)
        set(_vcov_SOURCES ${_vcov_SOURCES} ${_vcov_CLASSES})
        if(BUILD_SHARED_LIBS)
            add_library(${name} SHARED)
        else()
            add_library(${name} STATIC)
        endif()
        target_sources(${name} PRIVATE ${_vcov_SOURCES} ${_vcov_HEADERS})
        target_include_directories(${name} PUBLIC 
            ${Boost_INCLUDE_DIRS} 
            ${CMAKE_CURRENT_SOURCE_DIR} 
            ${CMAKE_CURRENT_BINARY_DIR}
        )
        target_link_libraries(${name} PUBLIC ${Boost_LIBRARIES})
    else()
        add_library(${name} INTERFACE)
        target_sources(${name} INTERFACE ${_vcov_HEADERS})
        target_include_directories(${name} INTERFACE 
            ${Boost_INCLUDE_DIRS} 
            ${CMAKE_CURRENT_BINARY_DIR}
        )
    endif()
    add_library(vcov::${name} ALIAS ${name})
endfunction()

#[==[.rst:
.. cmake:command:: vcov_module_add_dependencies

  .. code-block:: cmake

    vcov_module_add_dependencies(<name> 
        DEPENDENCIES [<name>...] 
    )
#]==]
function (vcov_module_add_dependencies module)
    cmake_parse_arguments(PARSE_ARGV 1 _vcov "" "" "DEPENDENCIES")
    if(NOT _vcov_DEPENDENCIES)
        message(FATAL_ERROR "No dependencies provided for module ${module}")
    endif()
    add_dependencies(${module} ${_vcov_DEPENDENCIES})
    set(_vcov_interface_deps "")
    set(_vcov_private_deps "")
    foreach(_vcov_dep ${_vcov_DEPENDENCIES})
        get_target_property(_vcov_dep_kind ${_vcov_dep} TYPE)
        if(_vcov_dep_kind STREQUAL "INTERFACE_LIBRARY")
            list(APPEND _vcov_interface_deps ${_vcov_dep})
        else()
            list(APPEND _vcov_private_deps ${_vcov_dep})
        endif()
        get_target_property(dep_includes ${_vcov_dep} INCLUDE_DIRECTORIES)
        if(dep_includes)
            target_include_directories(${module} PUBLIC ${dep_includes})
        endif()
    endforeach()

    if(_vcov_private_deps)
        target_link_libraries(${module} PRIVATE ${_vcov_private_deps})
    endif()
    if(_vcov_interface_deps)
        target_link_libraries(${module} INTERFACE ${_vcov_interface_deps})
    endif()
endfunction()

#[==[.rst:
.. cmake:command:: vcov_add_test

  .. code-block:: cmake

    vcov_add_test(<name>)
#]==]
function (vcov_add_test module)
    enable_testing()
    add_subdirectory(Testing)
endfunction()

#[==[.rst:
.. cmake:command:: vcov_add_test_sources

  .. code-block:: cmake

    vcov_add_test_sources(<name>
        SOURCES [<source>...] 
        DEPENDENCIES [<name>...] 
    )
#]==]
function (vcov_add_test_sources module)
    cmake_parse_arguments(PARSE_ARGV 1 _vcov "" "" "SOURCES;DEPENDENCIES")
    if(NOT _vcov_SOURCES)
        message(FATAL_ERROR "No test sources provided for module ${module}")
    endif()
    get_target_property(module_includes ${module} INCLUDE_DIRECTORIES)
    # see : https://cmake.org/cmake/help/latest/manual/cmake-properties.7.html#target-properties
    get_target_property(module_deps ${module} LINK_LIBRARIES)
    foreach(_vcov_source ${_vcov_SOURCES})
        get_filename_component(_vcov_source_name ${_vcov_source} NAME_WE)
        add_executable(${_vcov_source_name} ${_vcov_source})
        if(module_includes)
            target_include_directories(${_vcov_source_name}  PRIVATE 
                    ${module_includes} ${GTEST_INCLUDE_DIRS})
        endif()
        if(module_deps)
            target_link_libraries(${_vcov_source_name} PRIVATE 
                    ${module_deps} GTest::gtest GTest::gtest_main)
        endif()
        add_dependencies(${_vcov_source_name}  ${module})
        gtest_discover_tests(${_vcov_source_name})
    endforeach()
endfunction()