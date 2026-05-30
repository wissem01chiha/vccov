set(classes 
    ExportPluginDescription.cpp
)
set(headers
    ExportPluginDescription.hpp)

vcov_module_add_module(Export CLASSES ${classes} HEADERS ${headers})
#vcov_add_test(Export)