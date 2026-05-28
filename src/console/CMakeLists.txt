set(classes
    OpenCppCoverage.cpp
)
set(headers
    OpenCppCoverage.hpp
)

vccov_module_add_module(console CLASSES ${classes} HEADERS ${headers})
vccov_module_add_dependencies(console
    DEPENDENCIES 
        vccov::core
        vccov::coverage
        vccov::filter
        vccov::options
        vccov::export
        vccov::platform
        vccov::common
)

add_executable(vccov  main.cpp)
target_link_libraries(vccov PRIVATE vccov::console)
