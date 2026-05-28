set(classes 
    HandleInformation.cpp
)

set(headers
    HandleInformation.hpp
)

vccov_module_add_module(platform CLASSES ${classes} HEADERS ${headers})
vccov_module_add_dependencies(platform
    DEPENDENCIES    
        vccov::tools
        vccov::common
)
if(WIN32)
    target_link_libraries(platform PRIVATE diaguids.lib)
endif()
