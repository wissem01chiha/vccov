set(classes
    OpenCppCoverage.cpp
)
set(headers
    OpenCppCoverage.hpp
)

vcov_module_add_module(Console CLASSES ${classes} HEADERS ${headers})
vcov_module_add_dependencies(Console
    DEPENDENCIES 
        vcov::Core
        vcov::Coverage
        vcov::Filter
        vcov::Option
        vcov::Export
        vcov::Platform
        vcov::Common
        vcov::Cobertura
        vcov::Plugin
        vcov::Binary
        vcov::Html
)
vcov_add_test(Console)

add_executable(vcov  main.cpp)
target_link_libraries(vcov PRIVATE vcov::Console)
target_include_directories(vcov PRIVATE ${DIA_INCLUDE_DIRS})