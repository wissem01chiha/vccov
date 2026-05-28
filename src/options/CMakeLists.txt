set(classes
    Options.cpp
    OptionsParser.cpp
    ProgramOptions.cpp
    ExportOptionParser.cpp
    OptionsExport.cpp
)

set(headers
    Options.hpp
    OptionsParser.hpp
    ProgramOptions.hpp
    ProgramOptionsVariablesMap.hpp
    ExportOptionParser.hpp
    OptionsExport.hpp
)

vccov_module_add_module(options CLASSES ${classes})
vccov_module_add_dependencies(options
    DEPENDENCIES    
        vccov::tools
        vccov::common
)