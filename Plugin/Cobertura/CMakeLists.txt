set(classes 
    CoberturaExporter.cpp 
)

set(headers 
    CoberturaExporter.hpp 
    CoberturaExport.h
    CoberturaExport.h
)
vcov_module_add_module(Cobertura CLASSES ${classes} HEADERS ${headers})
vcov_module_add_dependencies(Cobertura
    DEPENDENCIES    
        Common
        Export
        Plugin
        Coverage
)