set(classes
    OpenCppCoverage.cpp
)
set(headers
    OpenCppCoverage.hpp
    ConsoleExport.h
)

vcov_module_add_module(Console CLASSES ${classes} HEADERS ${headers})
vcov_module_add_dependencies(Console
    DEPENDENCIES 
        Core
        Coverage
        Filter
        Option
        Export
        Platform
        Common
        Cobertura
        Plugin
        Binary
        Html
)
vcov_add_test(Console)

add_executable(vcov  main.cpp)
target_link_libraries(vcov PRIVATE Console DbgHelp.lib)
target_include_directories(vcov PRIVATE ${DIA_INCLUDE_DIRS} )