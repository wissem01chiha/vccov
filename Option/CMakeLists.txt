set(classes
    Options.cpp
    OptionsParser.cpp
    ProgramOptions.cpp
    ExportOptionParser.cpp
    OptionsExport.cpp
    UnifiedDiffSettings.cpp
)

set(headers
    Options.hpp
    OptionsParser.hpp
    ProgramOptions.hpp
    ProgramOptionsVariablesMap.hpp
    ExportOptionParser.hpp
    OptionsExport.hpp
    UnifiedDiffSettings.hpp
)

vcov_module_add_module(Option CLASSES ${classes})
vcov_module_add_dependencies(Option
    DEPENDENCIES    
        vcov::Common
        vcov::Core
        vcov::Export
)
vcov_add_test(Option)