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

vcov_module_add_module(Option CLASSES ${classes})
vcov_module_add_dependencies(Option
    DEPENDENCIES    
        vcov::Tools
        vcov::Common
)
vcov_add_test(Option)