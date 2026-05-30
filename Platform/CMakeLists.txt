set(classes 
    HandleInformation.cpp
)

set(headers
    HandleInformation.hpp
)

vcov_module_add_module(Platform CLASSES ${classes} HEADERS ${headers})
vcov_module_add_dependencies(Platform
    DEPENDENCIES    
        vcov::Common
        vcov::Core
)
if(WIN32)
    target_link_libraries(Platform PRIVATE diaguids.lib)
endif()
vcov_add_test(Platform)
