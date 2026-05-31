set(classes 
    CoberturaExporter.cpp 
)

set(headers 
    CoberturaExporter.hpp 
)
vcov_module_add_module(Cobertura CLASSES ${classes} HEADERS ${headers})
vcov_module_add_dependencies(Cobertura
    DEPENDENCIES    
        vcov::Common
        vcov::Export
        vcov::Plugin
        vcov::Coverage
)