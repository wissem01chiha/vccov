set(classes
    ExecutedAddressManager.cpp
    MonitoredLineRegister.cpp
    CoverageRate.cpp
    CoverageRateComputer.cpp
    CoverageDataMerger.cpp
    CodeCoverageRunner.cpp
    CodeCoverageRunner.hpp
    RunCoverageSettings.cpp
)

set(headers
    ExecutedAddressManager.hpp
    MonitoredLineRegister.hpp
    CoverageRate.hpp
    CoverageRateComputer.hpp
    CoverageDataMerger.hpp
    CodeCoverageRunner.hpp
    RunCoverageSettings.hpp
    CoverageExport.h
)

vcov_module_add_module(Coverage CLASSES ${classes} HEADERS ${headers})
vcov_module_add_dependencies(Coverage
    DEPENDENCIES
        Core
        Common
        Filter
        Plugin
        Binary
        Platform
        Export
        Option
)
vcov_add_test(Coverage)
