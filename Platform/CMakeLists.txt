set(classes 
    HandleInformation.cpp
)

set(headers
    HandleInformation.hpp
    PlatformExport.h
)

vcov_module_add_module(Platform CLASSES ${classes} HEADERS ${headers})
vcov_module_add_dependencies(Platform
    DEPENDENCIES    
        Common
        Core
)
vcov_add_test(Platform)
