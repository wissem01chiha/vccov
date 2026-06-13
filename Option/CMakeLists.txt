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
    OptionExport.h
)

vcov_module_add_module(Option CLASSES ${classes} HEADERS ${headers})
vcov_module_add_dependencies(Option
    DEPENDENCIES    
        Common
        Core
        Export
)
vcov_module_add_test(Option)