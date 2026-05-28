set(classes
    FileSystem.cpp
    Patterns.cpp
    Wildcards.cpp
)

set(headers
    FileSystem.hpp
    IFileSystem.hpp
    Patterns.hpp
    Wildcards.hpp
)

vccov_module_add_module(utils CLASSES ${classes} HEADERS ${headers})
vccov_module_add_dependencies(utils
    DEPENDENCIES    
        tools
)